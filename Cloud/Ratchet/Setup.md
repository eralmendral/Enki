# Ratchet - Complete Setup Guide

> Playwright E2E Test Code Generator with AWS Bedrock (Claude)

This guide walks you through setting up the entire Ratchet project from scratch, including AWS services, local development, and deployment.

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [AWS Account Setup](#2-aws-account-setup)
3. [Enable Amazon Bedrock](#3-enable-amazon-bedrock)
4. [Set Up AWS Infrastructure](#4-set-up-aws-infrastructure)
5. [Local Development Setup](#5-local-development-setup)
6. [Backend Setup (Go)](#6-backend-setup-go)
7. [Frontend Setup (Angular)](#7-frontend-setup-angular)
8. [ChromaDB Setup (Local Vector DB)](#8-chromadb-setup-local-vector-db)
9. [Connecting to AWS Bedrock](#9-connecting-to-aws-bedrock)
10. [Deployment to AWS](#10-deployment-to-aws)
11. [CI/CD Pipeline](#11-cicd-pipeline)
12. [Monitoring & Logging](#12-monitoring--logging)
13. [Troubleshooting](#13-troubleshooting)

---

## 1. Prerequisites

### Required Software

| Software | Version | Installation |
|----------|---------|--------------|
| Go | 1.25.5+ | https://go.dev/dl/ |
| Node.js | 22 LTS+ | https://nodejs.org/ |
| Angular CLI | 21+ | `npm install -g @angular/cli@latest` |
| Docker | Latest | https://www.docker.com/get-started |
| AWS CLI | v2 | https://aws.amazon.com/cli/ |
| Git | Latest | https://git-scm.com/ |

### Verify Installations

```bash
# Check all versions
go version          # go version go1.25.5
node --version      # v22.x.x
ng version          # Angular CLI: 21.x.x
docker --version    # Docker version 24.x.x
aws --version       # aws-cli/2.x.x
git --version       # git version 2.x.x
```

### AWS Account Requirements

- AWS Account with admin access (or sufficient IAM permissions)
- Credit card attached for billing
- Access to us-east-1 or us-west-2 region (Bedrock availability)

---

## 2. AWS Account Setup

### 2.1 Create IAM User for Development

1. Go to AWS Console → IAM → Users → Create User

2. Create a new user named `ratchet-dev`:
   ```
   User name: ratchet-dev
   Access type: Programmatic access
   ```

3. Attach the following policies (or create a custom policy):
   - `AmazonBedrockFullAccess`
   - `AmazonS3FullAccess`
   - `AmazonDynamoDBFullAccess`
   - `AmazonOpenSearchServiceFullAccess`
   - `AWSLambda_FullAccess`
   - `AmazonAPIGatewayAdministrator`
   - `CloudWatchFullAccess`

4. Download the Access Key ID and Secret Access Key

### 2.2 Configure AWS CLI

```bash
# Configure default profile
aws configure

# Enter your credentials:
# AWS Access Key ID: <your-access-key>
# AWS Secret Access Key: <your-secret-key>
# Default region name: us-east-1
# Default output format: json
```

### 2.3 Create a Named Profile (Recommended)

```bash
# Create a specific profile for Ratchet
aws configure --profile ratchet

# Verify configuration
aws sts get-caller-identity --profile ratchet
```

Expected output:
```json
{
    "UserId": "AIDAXXXXXXXXXXXXXXXXX",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/ratchet-dev"
}
```

---

## 3. Enable Amazon Bedrock

### 3.1 Request Model Access

Amazon Bedrock requires you to request access to foundation models before use.

1. Go to **AWS Console** → **Amazon Bedrock**

2. In the left sidebar, click **Model access**

3. Click **Manage model access**

4. Select the following models:
   - ✅ **Anthropic Claude 3.5 Sonnet** (recommended for code generation)
   - ✅ **Anthropic Claude 3 Haiku** (for faster, cheaper operations)
   - ✅ **Amazon Titan Text Embeddings V2** (for vector embeddings)

5. Click **Request model access**

6. Accept the EULA for each provider

7. Wait for approval (usually instant for most models)

### 3.2 Verify Model Access

```bash
# List available foundation models
aws bedrock list-foundation-models \
    --profile ratchet \
    --region us-east-1 \
    --query "modelSummaries[?providerName=='Anthropic'].modelId"
```

Expected output:
```json
[
    "anthropic.claude-3-5-sonnet-20241022-v2:0",
    "anthropic.claude-3-haiku-20240307-v1:0",
    "anthropic.claude-3-sonnet-20240229-v1:0"
]
```

### 3.3 Test Bedrock Access

Create a test file to verify Bedrock is working:

```bash
# Create test request
cat > /tmp/bedrock-test.json << 'EOF'
{
    "anthropic_version": "bedrock-2023-05-31",
    "max_tokens": 100,
    "messages": [
        {
            "role": "user",
            "content": "Say hello in one sentence."
        }
    ]
}
EOF

# Invoke Claude
aws bedrock-runtime invoke-model \
    --profile ratchet \
    --region us-east-1 \
    --model-id anthropic.claude-3-haiku-20240307-v1:0 \
    --content-type application/json \
    --body file:///tmp/bedrock-test.json \
    /tmp/bedrock-response.json

# View response
cat /tmp/bedrock-response.json | jq '.content[0].text'
```

If successful, you'll see Claude's response!

---

## 4. Set Up AWS Infrastructure

### 4.1 Create S3 Buckets

```bash
# Set your unique bucket prefix (must be globally unique)
BUCKET_PREFIX="ratchet-$(aws sts get-caller-identity --query Account --output text)"

# Create bucket for Angular frontend
aws s3 mb s3://${BUCKET_PREFIX}-frontend \
    --profile ratchet \
    --region us-east-1

# Create bucket for templates storage
aws s3 mb s3://${BUCKET_PREFIX}-templates \
    --profile ratchet \
    --region us-east-1

# Enable static website hosting for frontend
aws s3 website s3://${BUCKET_PREFIX}-frontend \
    --index-document index.html \
    --error-document index.html \
    --profile ratchet

# Set bucket policy for public read (frontend only)
cat > /tmp/bucket-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${BUCKET_PREFIX}-frontend/*"
        }
    ]
}
EOF

aws s3api put-bucket-policy \
    --bucket ${BUCKET_PREFIX}-frontend \
    --policy file:///tmp/bucket-policy.json \
    --profile ratchet
```

### 4.2 Create DynamoDB Tables

```bash
# Create selectors table
aws dynamodb create-table \
    --table-name ratchet-selectors \
    --attribute-definitions \
        AttributeName=page,AttributeType=S \
        AttributeName=name,AttributeType=S \
    --key-schema \
        AttributeName=page,KeyType=HASH \
        AttributeName=name,KeyType=RANGE \
    --billing-mode PAY_PER_REQUEST \
    --profile ratchet \
    --region us-east-1

# Create templates metadata table
aws dynamodb create-table \
    --table-name ratchet-templates \
    --attribute-definitions \
        AttributeName=id,AttributeType=S \
        AttributeName=category,AttributeType=S \
    --key-schema \
        AttributeName=id,KeyType=HASH \
    --global-secondary-indexes \
        "[{\"IndexName\": \"category-index\",\"KeySchema\":[{\"AttributeName\":\"category\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}]" \
    --billing-mode PAY_PER_REQUEST \
    --profile ratchet \
    --region us-east-1

# Verify tables created
aws dynamodb list-tables --profile ratchet --region us-east-1
```

### 4.3 Create OpenSearch Serverless Collection (Vector DB)

```bash
# Create encryption policy
cat > /tmp/encryption-policy.json << 'EOF'
{
    "Rules": [
        {
            "ResourceType": "collection",
            "Resource": ["collection/ratchet-vectors"]
        }
    ],
    "AWSOwnedKey": true
}
EOF

aws opensearchserverless create-security-policy \
    --name ratchet-encryption \
    --type encryption \
    --policy file:///tmp/encryption-policy.json \
    --profile ratchet \
    --region us-east-1

# Create network policy (public access for development)
cat > /tmp/network-policy.json << 'EOF'
[
    {
        "Rules": [
            {
                "ResourceType": "collection",
                "Resource": ["collection/ratchet-vectors"]
            },
            {
                "ResourceType": "dashboard",
                "Resource": ["collection/ratchet-vectors"]
            }
        ],
        "AllowFromPublic": true
    }
]
EOF

aws opensearchserverless create-security-policy \
    --name ratchet-network \
    --type network \
    --policy file:///tmp/network-policy.json \
    --profile ratchet \
    --region us-east-1

# Create data access policy
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text --profile ratchet)

cat > /tmp/data-policy.json << EOF
[
    {
        "Rules": [
            {
                "ResourceType": "collection",
                "Resource": ["collection/ratchet-vectors"],
                "Permission": [
                    "aoss:CreateCollectionItems",
                    "aoss:DeleteCollectionItems",
                    "aoss:UpdateCollectionItems",
                    "aoss:DescribeCollectionItems"
                ]
            },
            {
                "ResourceType": "index",
                "Resource": ["index/ratchet-vectors/*"],
                "Permission": [
                    "aoss:CreateIndex",
                    "aoss:DeleteIndex",
                    "aoss:UpdateIndex",
                    "aoss:DescribeIndex",
                    "aoss:ReadDocument",
                    "aoss:WriteDocument"
                ]
            }
        ],
        "Principal": ["arn:aws:iam::${ACCOUNT_ID}:user/ratchet-dev"]
    }
]
EOF

aws opensearchserverless create-access-policy \
    --name ratchet-data \
    --type data \
    --policy file:///tmp/data-policy.json \
    --profile ratchet \
    --region us-east-1

# Create the collection
aws opensearchserverless create-collection \
    --name ratchet-vectors \
    --type VECTORSEARCH \
    --profile ratchet \
    --region us-east-1

# Wait for collection to be active (takes 2-5 minutes)
echo "Waiting for collection to be active..."
aws opensearchserverless batch-get-collection \
    --names ratchet-vectors \
    --profile ratchet \
    --region us-east-1 \
    --query "collectionDetails[0].status"
```

### 4.4 Create Secrets Manager Secret

```bash
# Store any external API keys (optional, for future use)
aws secretsmanager create-secret \
    --name ratchet/config \
    --secret-string '{"environment":"development"}' \
    --profile ratchet \
    --region us-east-1
```

---

## 5. Local Development Setup

### 5.1 Clone/Initialize Repository

```bash
cd ~/Projects/Ratchet

# Initialize git (if not already)
git init
```

### 5.2 Create Environment Configuration

```bash
# Create environment file for local development
cat > .env << 'EOF'
# AWS Configuration
AWS_PROFILE=ratchet
AWS_REGION=us-east-1

# Bedrock Configuration
BEDROCK_MODEL_ID=anthropic.claude-3-5-sonnet-20241022-v2:0
BEDROCK_EMBEDDING_MODEL_ID=amazon.titan-embed-text-v2:0

# Local Development
CHROMA_URL=http://localhost:8000
API_PORT=8080
FRONTEND_URL=http://localhost:4200

# Feature Flags
USE_LOCAL_VECTORDB=true
EOF

# Create .env.example (for version control)
cp .env .env.example
echo ".env" >> .gitignore
```

### 5.3 Create Docker Compose for Local Services

```bash
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  chromadb:
    image: chromadb/chroma:latest
    container_name: ratchet-chromadb
    ports:
      - "8000:8000"
    volumes:
      - ./data/chroma:/chroma/chroma
    environment:
      - IS_PERSISTENT=TRUE
      - ANONYMIZED_TELEMETRY=FALSE

  # Optional: DynamoDB Local for offline development
  dynamodb-local:
    image: amazon/dynamodb-local:latest
    container_name: ratchet-dynamodb
    ports:
      - "8001:8000"
    command: "-jar DynamoDBLocal.jar -sharedDb -dbPath /data"
    volumes:
      - ./data/dynamodb:/data

volumes:
  chroma-data:
  dynamodb-data:
EOF
```

### 5.4 Start Local Services

```bash
# Create data directories
mkdir -p data/chroma data/dynamodb

# Start services
docker-compose up -d

# Verify services are running
docker-compose ps

# Test ChromaDB
curl http://localhost:8000/api/v1/heartbeat
```

---

## 6. Backend Setup (Go)

### 6.1 Initialize Go Module

```bash
# Create backend directory
mkdir -p backend
cd backend

# Initialize Go module
go mod init github.com/your-username/ratchet

# Create directory structure
mkdir -p cmd/server
mkdir -p internal/{api/handlers,api/middleware,services/{claude,rag,template,validation},prompt,models}
mkdir -p templates/{auth,crud,navigation,forms}
mkdir -p selectors
```

### 6.2 Install Dependencies

```bash
# HTTP Router
go get github.com/go-chi/chi/v5
go get github.com/go-chi/cors

# AWS SDK v2
go get github.com/aws/aws-sdk-go-v2
go get github.com/aws/aws-sdk-go-v2/config
go get github.com/aws/aws-sdk-go-v2/service/bedrockruntime
go get github.com/aws/aws-sdk-go-v2/service/dynamodb
go get github.com/aws/aws-sdk-go-v2/service/s3

# ChromaDB client
go get github.com/amikos-tech/chroma-go

# Utilities
go get github.com/joho/godotenv
go get github.com/rs/zerolog

# Tidy up
go mod tidy
```

### 6.3 Create Main Entry Point

```bash
cat > cmd/server/main.go << 'EOF'
package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/cors"
	"github.com/joho/godotenv"
)

func main() {
	// Load environment variables
	if err := godotenv.Load("../../.env"); err != nil {
		log.Println("No .env file found, using system environment")
	}

	// Create router
	r := chi.NewRouter()

	// Middleware
	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)
	r.Use(middleware.RequestID)
	r.Use(cors.Handler(cors.Options{
		AllowedOrigins:   []string{"http://localhost:4200"},
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type"},
		ExposedHeaders:   []string{"Link"},
		AllowCredentials: true,
		MaxAge:           300,
	}))

	// Health check
	r.Get("/health", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("OK"))
	})

	// API routes
	r.Route("/api", func(r chi.Router) {
		r.Post("/generate", handleGenerate)
		r.Get("/templates", handleListTemplates)
		r.Get("/selectors", handleListSelectors)
	})

	// Get port from environment
	port := os.Getenv("API_PORT")
	if port == "" {
		port = "8080"
	}

	// Create server
	srv := &http.Server{
		Addr:    ":" + port,
		Handler: r,
	}

	// Graceful shutdown
	go func() {
		log.Printf("Starting server on port %s", port)
		if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("Server error: %v", err)
		}
	}()

	// Wait for interrupt signal
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit

	log.Println("Shutting down server...")
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	if err := srv.Shutdown(ctx); err != nil {
		log.Fatalf("Server forced to shutdown: %v", err)
	}

	log.Println("Server exited")
}

// Placeholder handlers - to be implemented
func handleGenerate(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte(`{"message": "Generate endpoint - TODO"}`))
}

func handleListTemplates(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte(`{"templates": []}`))
}

func handleListSelectors(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte(`{"selectors": []}`))
}
EOF
```

### 6.4 Create Bedrock Client Service

```bash
cat > internal/services/claude/client.go << 'EOF'
package claude

import (
	"context"
	"encoding/json"
	"fmt"
	"os"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/bedrockruntime"
)

// BedrockClient wraps the AWS Bedrock Runtime client
type BedrockClient struct {
	client  *bedrockruntime.Client
	modelID string
}

// ClaudeRequest represents the request format for Claude models
type ClaudeRequest struct {
	AnthropicVersion string    `json:"anthropic_version"`
	MaxTokens        int       `json:"max_tokens"`
	System           string    `json:"system,omitempty"`
	Messages         []Message `json:"messages"`
}

// Message represents a conversation message
type Message struct {
	Role    string `json:"role"`
	Content string `json:"content"`
}

// ClaudeResponse represents the response from Claude
type ClaudeResponse struct {
	ID           string        `json:"id"`
	Type         string        `json:"type"`
	Role         string        `json:"role"`
	Content      []ContentBlock `json:"content"`
	StopReason   string        `json:"stop_reason"`
	Usage        Usage         `json:"usage"`
}

type ContentBlock struct {
	Type string `json:"type"`
	Text string `json:"text"`
}

type Usage struct {
	InputTokens  int `json:"input_tokens"`
	OutputTokens int `json:"output_tokens"`
}

// NewBedrockClient creates a new Bedrock client
func NewBedrockClient(ctx context.Context) (*BedrockClient, error) {
	// Load AWS configuration
	cfg, err := config.LoadDefaultConfig(ctx,
		config.WithRegion(os.Getenv("AWS_REGION")),
	)
	if err != nil {
		return nil, fmt.Errorf("failed to load AWS config: %w", err)
	}

	// Get model ID from environment or use default
	modelID := os.Getenv("BEDROCK_MODEL_ID")
	if modelID == "" {
		modelID = "anthropic.claude-3-5-sonnet-20241022-v2:0"
	}

	return &BedrockClient{
		client:  bedrockruntime.NewFromConfig(cfg),
		modelID: modelID,
	}, nil
}

// Generate sends a prompt to Claude and returns the generated text
func (c *BedrockClient) Generate(ctx context.Context, systemPrompt, userPrompt string) (string, error) {
	// Build request
	request := ClaudeRequest{
		AnthropicVersion: "bedrock-2023-05-31",
		MaxTokens:        4096,
		System:           systemPrompt,
		Messages: []Message{
			{
				Role:    "user",
				Content: userPrompt,
			},
		},
	}

	// Marshal request to JSON
	requestBody, err := json.Marshal(request)
	if err != nil {
		return "", fmt.Errorf("failed to marshal request: %w", err)
	}

	// Invoke model
	output, err := c.client.InvokeModel(ctx, &bedrockruntime.InvokeModelInput{
		ModelId:     aws.String(c.modelID),
		ContentType: aws.String("application/json"),
		Body:        requestBody,
	})
	if err != nil {
		return "", fmt.Errorf("failed to invoke model: %w", err)
	}

	// Parse response
	var response ClaudeResponse
	if err := json.Unmarshal(output.Body, &response); err != nil {
		return "", fmt.Errorf("failed to unmarshal response: %w", err)
	}

	// Extract text from response
	if len(response.Content) == 0 {
		return "", fmt.Errorf("empty response from Claude")
	}

	return response.Content[0].Text, nil
}

// GenerateTestCode generates Playwright test code from a description
func (c *BedrockClient) GenerateTestCode(ctx context.Context, description string, template string, selectors string) (string, error) {
	systemPrompt := `You are a Playwright test code generator. Generate ONLY executable TypeScript Playwright tests.

RULES:
1. Output ONLY the TypeScript code - no explanations, no markdown code blocks
2. Use ONLY the provided selectors - never invent selectors
3. Follow the template structure exactly
4. Include proper waits and assertions
5. Use data-testid attributes when available
6. Always import { test, expect } from '@playwright/test'

AVAILABLE SELECTORS:
` + selectors + `

REFERENCE TEMPLATE:
` + template

	userPrompt := fmt.Sprintf("Generate a Playwright test for: %s", description)

	return c.Generate(ctx, systemPrompt, userPrompt)
}
EOF
```

### 6.5 Create Embedding Service

```bash
cat > internal/services/rag/embeddings.go << 'EOF'
package rag

import (
	"context"
	"encoding/json"
	"fmt"
	"os"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/bedrockruntime"
)

// EmbeddingService generates text embeddings using Amazon Titan
type EmbeddingService struct {
	client  *bedrockruntime.Client
	modelID string
}

// TitanEmbeddingRequest represents the request format for Titan Embeddings
type TitanEmbeddingRequest struct {
	InputText string `json:"inputText"`
}

// TitanEmbeddingResponse represents the response from Titan Embeddings
type TitanEmbeddingResponse struct {
	Embedding []float32 `json:"embedding"`
}

// NewEmbeddingService creates a new embedding service
func NewEmbeddingService(ctx context.Context) (*EmbeddingService, error) {
	cfg, err := config.LoadDefaultConfig(ctx,
		config.WithRegion(os.Getenv("AWS_REGION")),
	)
	if err != nil {
		return nil, fmt.Errorf("failed to load AWS config: %w", err)
	}

	modelID := os.Getenv("BEDROCK_EMBEDDING_MODEL_ID")
	if modelID == "" {
		modelID = "amazon.titan-embed-text-v2:0"
	}

	return &EmbeddingService{
		client:  bedrockruntime.NewFromConfig(cfg),
		modelID: modelID,
	}, nil
}

// GetEmbedding generates an embedding vector for the given text
func (s *EmbeddingService) GetEmbedding(ctx context.Context, text string) ([]float32, error) {
	request := TitanEmbeddingRequest{
		InputText: text,
	}

	requestBody, err := json.Marshal(request)
	if err != nil {
		return nil, fmt.Errorf("failed to marshal request: %w", err)
	}

	output, err := s.client.InvokeModel(ctx, &bedrockruntime.InvokeModelInput{
		ModelId:     aws.String(s.modelID),
		ContentType: aws.String("application/json"),
		Body:        requestBody,
	})
	if err != nil {
		return nil, fmt.Errorf("failed to invoke embedding model: %w", err)
	}

	var response TitanEmbeddingResponse
	if err := json.Unmarshal(output.Body, &response); err != nil {
		return nil, fmt.Errorf("failed to unmarshal response: %w", err)
	}

	return response.Embedding, nil
}

// GetEmbeddings generates embeddings for multiple texts
func (s *EmbeddingService) GetEmbeddings(ctx context.Context, texts []string) ([][]float32, error) {
	embeddings := make([][]float32, len(texts))

	for i, text := range texts {
		embedding, err := s.GetEmbedding(ctx, text)
		if err != nil {
			return nil, fmt.Errorf("failed to get embedding for text %d: %w", i, err)
		}
		embeddings[i] = embedding
	}

	return embeddings, nil
}
EOF
```

### 6.6 Run the Backend

```bash
cd backend

# Run the server
go run cmd/server/main.go

# In another terminal, test the endpoint
curl http://localhost:8080/health
curl http://localhost:8080/api/templates
```

---

## 7. Frontend Setup (Angular)

### 7.1 Create Angular Project

```bash
cd ~/Projects/Ratchet

# Create new Angular project (Angular 19+ uses standalone components by default)
ng new frontend --style=scss --ssr=false

cd frontend
```

> **Note**: Angular 19+ uses standalone components by default and includes routing. The `--routing` flag is no longer needed.

### 7.2 Install Dependencies

```bash
# UI Components and Styling
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init

# Monaco Editor for code display
npm install ngx-monaco-editor-v2

# HTTP client is included in Angular
# Icons
npm install lucide-angular

# Clipboard
npm install ngx-clipboard
```

### 7.3 Configure Tailwind CSS

```bash
# Update tailwind.config.js
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['DM Sans', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
      colors: {
        primary: {
          50: '#f0f9ff',
          100: '#e0f2fe',
          200: '#bae6fd',
          300: '#7dd3fc',
          400: '#38bdf8',
          500: '#0ea5e9',
          600: '#0284c7',
          700: '#0369a1',
          800: '#075985',
          900: '#0c4a6e',
        },
      },
    },
  },
  plugins: [],
}
EOF

# Update src/styles.scss
cat > src/styles.scss << 'EOF'
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  @apply bg-slate-950 text-slate-100 font-sans;
}

@layer components {
  .btn-primary {
    @apply bg-primary-600 hover:bg-primary-700 text-white font-medium py-2 px-4 rounded-lg transition-colors;
  }
  
  .input-field {
    @apply w-full bg-slate-800 border border-slate-700 rounded-lg px-4 py-3 text-slate-100 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent;
  }
  
  .card {
    @apply bg-slate-900 border border-slate-800 rounded-xl p-6;
  }
}
EOF
```

### 7.4 Create API Service

```bash
# Create services directory
mkdir -p src/app/services

cat > src/app/services/api.service.ts << 'EOF'
import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface GenerateRequest {
  description: string;
  category?: string;
  page?: string;
}

export interface GenerateResponse {
  code: string;
  templateUsed: string;
  validation: {
    valid: boolean;
    syntaxValid: boolean;
    selectorsValid: boolean;
    errors?: string[];
    warnings?: string[];
  };
}

export interface Template {
  id: string;
  name: string;
  category: string;
  description: string;
}

export interface Selector {
  page: string;
  name: string;
  selector: string;
  type: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private readonly http = inject(HttpClient);
  private readonly baseUrl = environment.apiUrl;

  generateTest(request: GenerateRequest): Observable<GenerateResponse> {
    return this.http.post<GenerateResponse>(`${this.baseUrl}/generate`, request);
  }

  getTemplates(): Observable<{ templates: Template[] }> {
    return this.http.get<{ templates: Template[] }>(`${this.baseUrl}/templates`);
  }

  getSelectors(): Observable<{ selectors: Selector[] }> {
    return this.http.get<{ selectors: Selector[] }>(`${this.baseUrl}/selectors`);
  }
}
EOF
```

### 7.5 Configure App for HTTP Client

Angular 19 uses standalone components. Update `app.config.ts` to provide HttpClient:

```bash
cat > src/app/app.config.ts << 'EOF'
import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withFetch } from '@angular/common/http';

import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideHttpClient(withFetch())
  ]
};
EOF
```

### 7.6 Create Environment Files

```bash
# Create environments directory
mkdir -p src/environments

# Development environment
cat > src/environments/environment.ts << 'EOF'
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api'
};
EOF

# Production environment
cat > src/environments/environment.prod.ts << 'EOF'
export const environment = {
  production: true,
  apiUrl: '/api'  // Will be proxied through CloudFront
};
EOF
```

### 7.7 Run Frontend

```bash
cd frontend
ng serve

# Open http://localhost:4200
```

---

## 8. ChromaDB Setup (Local Vector DB)

### 8.1 Start ChromaDB

```bash
cd ~/Projects/Ratchet

# Start with Docker Compose
docker-compose up -d chromadb

# Verify it's running
curl http://localhost:8000/api/v1/heartbeat
# Expected: {"nanosecond heartbeat": 1234567890}
```

### 8.2 Create Collections

```bash
# Create collections using curl (or use Go client)
# Templates collection
curl -X POST http://localhost:8000/api/v1/collections \
  -H "Content-Type: application/json" \
  -d '{"name": "templates", "metadata": {"description": "Playwright test templates"}}'

# Selectors collection  
curl -X POST http://localhost:8000/api/v1/collections \
  -H "Content-Type: application/json" \
  -d '{"name": "selectors", "metadata": {"description": "CSS selectors registry"}}'

# Patterns collection
curl -X POST http://localhost:8000/api/v1/collections \
  -H "Content-Type: application/json" \
  -d '{"name": "patterns", "metadata": {"description": "Common test patterns"}}'

# List collections
curl http://localhost:8000/api/v1/collections
```

---

## 9. Connecting to AWS Bedrock

### 9.1 Test Bedrock from Go

```bash
cd backend

# Create a test file
cat > cmd/bedrock-test/main.go << 'EOF'
package main

import (
	"context"
	"fmt"
	"log"

	"github.com/joho/godotenv"
	"github.com/your-username/ratchet/internal/services/claude"
)

func main() {
	// Load environment
	if err := godotenv.Load("../../.env"); err != nil {
		log.Println("No .env file found")
	}

	ctx := context.Background()

	// Create Bedrock client
	client, err := claude.NewBedrockClient(ctx)
	if err != nil {
		log.Fatalf("Failed to create client: %v", err)
	}

	// Test generation
	response, err := client.Generate(ctx,
		"You are a helpful assistant.",
		"Say hello and confirm you are Claude running on AWS Bedrock.",
	)
	if err != nil {
		log.Fatalf("Failed to generate: %v", err)
	}

	fmt.Println("Response from Claude:")
	fmt.Println(response)
}
EOF

# Run the test
go run cmd/bedrock-test/main.go
```

### 9.2 Test Embeddings

```bash
cat > cmd/embedding-test/main.go << 'EOF'
package main

import (
	"context"
	"fmt"
	"log"

	"github.com/joho/godotenv"
	"github.com/your-username/ratchet/internal/services/rag"
)

func main() {
	if err := godotenv.Load("../../.env"); err != nil {
		log.Println("No .env file found")
	}

	ctx := context.Background()

	service, err := rag.NewEmbeddingService(ctx)
	if err != nil {
		log.Fatalf("Failed to create embedding service: %v", err)
	}

	embedding, err := service.GetEmbedding(ctx, "User login with email and password")
	if err != nil {
		log.Fatalf("Failed to get embedding: %v", err)
	}

	fmt.Printf("Embedding dimensions: %d\n", len(embedding))
	fmt.Printf("First 5 values: %v\n", embedding[:5])
}
EOF

go run cmd/embedding-test/main.go
```

---

## 10. Deployment to AWS

### 10.1 Build and Package Lambda

```bash
cd backend

# Build for Lambda (Linux ARM64 for Graviton)
GOOS=linux GOARCH=arm64 go build -tags lambda.norpc -o bootstrap cmd/server/main.go

# Create deployment package
zip function.zip bootstrap

# Create Lambda function
aws lambda create-function \
    --function-name ratchet-api \
    --runtime provided.al2023 \
    --architectures arm64 \
    --handler bootstrap \
    --role arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):role/ratchet-lambda-role \
    --zip-file fileb://function.zip \
    --timeout 30 \
    --memory-size 512 \
    --environment "Variables={AWS_REGION=us-east-1,BEDROCK_MODEL_ID=anthropic.claude-3-5-sonnet-20241022-v2:0}" \
    --profile ratchet \
    --region us-east-1
```

### 10.2 Create Lambda IAM Role

```bash
# Create trust policy
cat > /tmp/lambda-trust-policy.json << 'EOF'
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF

# Create role
aws iam create-role \
    --role-name ratchet-lambda-role \
    --assume-role-policy-document file:///tmp/lambda-trust-policy.json \
    --profile ratchet

# Attach policies
aws iam attach-role-policy \
    --role-name ratchet-lambda-role \
    --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole \
    --profile ratchet

aws iam attach-role-policy \
    --role-name ratchet-lambda-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonBedrockFullAccess \
    --profile ratchet

aws iam attach-role-policy \
    --role-name ratchet-lambda-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess \
    --profile ratchet

aws iam attach-role-policy \
    --role-name ratchet-lambda-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
    --profile ratchet
```

### 10.3 Deploy Frontend to S3

```bash
cd frontend

# Build production bundle
ng build --configuration production

# Get bucket name
BUCKET_PREFIX="ratchet-$(aws sts get-caller-identity --query Account --output text --profile ratchet)"

# Sync to S3
aws s3 sync dist/frontend/browser s3://${BUCKET_PREFIX}-frontend \
    --delete \
    --profile ratchet

# Invalidate CloudFront cache (if configured)
# aws cloudfront create-invalidation --distribution-id YOUR_DIST_ID --paths "/*"
```

### 10.4 Create API Gateway

```bash
# Create REST API
aws apigateway create-rest-api \
    --name ratchet-api \
    --endpoint-configuration types=REGIONAL \
    --profile ratchet \
    --region us-east-1

# Note the API ID from output, then configure resources and methods
# This is typically done via CDK or Terraform for complex setups
```

---

## 11. CI/CD Pipeline

### 11.1 GitHub Actions Workflow

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy Ratchet

on:
  push:
    branches: [main]
  workflow_dispatch:

env:
  AWS_REGION: us-east-1

jobs:
  deploy-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Set up Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.25'
      
      - name: Build Lambda
        run: |
          cd backend
          GOOS=linux GOARCH=arm64 go build -tags lambda.norpc -o bootstrap cmd/server/main.go
          zip function.zip bootstrap
      
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}
      
      - name: Deploy to Lambda
        run: |
          aws lambda update-function-code \
            --function-name ratchet-api \
            --zip-file fileb://backend/function.zip

  deploy-frontend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'npm'
          cache-dependency-path: frontend/package-lock.json
      
      - name: Install and Build
        run: |
          cd frontend
          npm ci
          npm run build -- --configuration production
      
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}
      
      - name: Deploy to S3
        run: |
          BUCKET="ratchet-${{ secrets.AWS_ACCOUNT_ID }}-frontend"
          aws s3 sync frontend/dist/frontend/browser s3://$BUCKET --delete
```

### 11.2 Add GitHub Secrets

In your GitHub repository settings, add:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_ACCOUNT_ID`

---

## 12. Monitoring & Logging

### 12.1 CloudWatch Dashboard

```bash
# Create dashboard
aws cloudwatch put-dashboard \
    --dashboard-name ratchet-monitoring \
    --dashboard-body file:///tmp/dashboard.json \
    --profile ratchet \
    --region us-east-1
```

### 12.2 Set Up Alarms

```bash
# Lambda error alarm
aws cloudwatch put-metric-alarm \
    --alarm-name ratchet-lambda-errors \
    --metric-name Errors \
    --namespace AWS/Lambda \
    --statistic Sum \
    --period 300 \
    --threshold 5 \
    --comparison-operator GreaterThanThreshold \
    --dimensions Name=FunctionName,Value=ratchet-api \
    --evaluation-periods 1 \
    --alarm-actions arn:aws:sns:us-east-1:ACCOUNT_ID:alerts \
    --profile ratchet \
    --region us-east-1
```

### 12.3 Enable X-Ray Tracing

```bash
aws lambda update-function-configuration \
    --function-name ratchet-api \
    --tracing-config Mode=Active \
    --profile ratchet \
    --region us-east-1
```

---

## 13. Troubleshooting

### Common Issues

#### 1. Bedrock Access Denied

```
Error: AccessDeniedException: User is not authorized to perform bedrock:InvokeModel
```

**Solution**: Ensure model access is granted in Bedrock console and IAM policies are attached.

```bash
# Check if model access is granted
aws bedrock list-foundation-models --profile ratchet --region us-east-1

# Verify IAM permissions
aws iam list-attached-user-policies --user-name ratchet-dev --profile ratchet
```

#### 2. ChromaDB Connection Refused

```
Error: dial tcp 127.0.0.1:8000: connect: connection refused
```

**Solution**: Ensure Docker container is running.

```bash
docker-compose ps
docker-compose up -d chromadb
```

#### 3. CORS Errors in Browser

```
Access to XMLHttpRequest has been blocked by CORS policy
```

**Solution**: Verify CORS configuration in Go backend matches your frontend URL.

#### 4. Lambda Cold Start Timeout

**Solution**: Increase Lambda memory (which also increases CPU) or use provisioned concurrency.

```bash
aws lambda update-function-configuration \
    --function-name ratchet-api \
    --memory-size 1024 \
    --profile ratchet
```

#### 5. OpenSearch Connection Issues

**Solution**: Verify security policies allow your IAM user/role.

```bash
aws opensearchserverless list-access-policies --type data --profile ratchet
```

---

## Quick Reference

### Local Development Commands

```bash
# Start all local services
docker-compose up -d

# Run backend
cd backend && go run cmd/server/main.go

# Run frontend
cd frontend && ng serve

# View logs
docker-compose logs -f chromadb
```

### AWS CLI Quick Commands

```bash
# Check Bedrock models
aws bedrock list-foundation-models --profile ratchet --region us-east-1 | jq '.modelSummaries[].modelId'

# Test Lambda
aws lambda invoke --function-name ratchet-api --payload '{}' /tmp/response.json --profile ratchet

# View Lambda logs
aws logs tail /aws/lambda/ratchet-api --follow --profile ratchet

# Check DynamoDB tables
aws dynamodb list-tables --profile ratchet
```

### Useful Links

- [Amazon Bedrock Documentation](https://docs.aws.amazon.com/bedrock/)
- [Claude on Bedrock](https://docs.anthropic.com/en/api/claude-on-amazon-bedrock)
- [AWS SDK for Go v2](https://aws.github.io/aws-sdk-go-v2/docs/)
- [Playwright Documentation](https://playwright.dev/docs/intro)
- [ChromaDB Documentation](https://docs.trychroma.com/)

---

## Next Steps

1. Complete the template collection with 10+ Playwright templates
2. Implement the full RAG pipeline with ChromaDB
3. Build remaining Angular components
4. Add authentication with Cognito
5. Set up CloudFront for production
6. Configure custom domain

