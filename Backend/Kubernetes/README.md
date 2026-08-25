# Kubernetes (K8s)

Kubernetes, often shortened to K8s, is an open-source system for automating the deployment, scaling, and management of containerized applications.

Its main job is to run software applications across a group of machines and manage the resources those applications need, such as:

- CPU
- RAM
- Disk space
- Network access

## Mental Model

Think of Kubernetes as the conductor of a large orchestra.

If one musician is playing one instrument, you can manage them directly. If 1,000 musicians need to stay in sync, adjust to changing conditions, and recover when someone is missing, you need a system that coordinates everything.

In this analogy:

- **Containers** are the musicians. Each one runs a specific application process.
- **Nodes** are the chairs and stages where the musicians run.
- **Kubernetes** is the conductor. It decides where workloads run, keeps the desired number of workloads available, and helps route traffic to them.

## Kubernetes Areas Summary

- **Pods**: Run one or more containers together.
- **Deployments**: Manage application replicas and rolling updates.
- **ConfigMaps**: Store non-sensitive configuration data for applications.
- **Services**: Provide stable network access to Pods.
- **Gateway**: Defines how external traffic enters the cluster and reaches Services.
- **Storage**: Provides persistent data for applications that need to keep state.
- **Namespaces**: Group and separate resources inside a cluster.
- **Scaling**: Increases or decreases application capacity.
- **Nodes**: Machines that run Kubernetes workloads.

## Core Concepts

| Term | Meaning |
| --- | --- |
| Kubernetes | A distributed system for running and managing software applications across multiple machines. |
| `kubectl` | The command-line client used to communicate with the Kubernetes API. |
| Node | A physical machine or virtual machine that runs Kubernetes workloads. |
| Pod | The smallest deployable unit in Kubernetes. A Pod wraps one or more containers. |
| Container | The running application process created from an image. |
| Image | A template used to create containers. |
| Deployment | A Kubernetes object that manages application replicas and rolling updates. |
| ReplicaSet | A Kubernetes object that keeps the desired number of Pod replicas running. |
| ConfigMap | A Kubernetes object used to store non-sensitive configuration data. |
| Service | A stable network endpoint used to access a group of Pods. |
| Gateway | A Kubernetes networking resource that controls how traffic enters the cluster. |
| Storage | Persistent data support, commonly handled through PersistentVolumes and PersistentVolumeClaims. |
| Namespace | A logical grouping used to separate resources inside a cluster. |
| Scaling | The process of increasing or decreasing replicas or resources for an application. |

## Networking Notes

- Resources inside Kubernetes run on a cluster network.
- Pods are not automatically exposed outside the cluster.
- Use port forwarding when you need temporary local access to a Pod or Service.
- For stable application access, Kubernetes usually uses a Service.

## Common Commands

### Check Cluster Access

```bash
kubectl version
kubectl get nodes
```

### Create and Inspect a Deployment

```bash
kubectl create deployment <deployment-name> --image=<image-name>
kubectl get deployments
kubectl get replicasets
```

### Work With Pods

| Task | Command |
| --- | --- |
| List Pods | `kubectl get pods` |
| List Pods with extra details | `kubectl get pods -o wide` |
| Forward a local port to a Pod | `kubectl port-forward pod/<pod-name> <local-port>:<pod-port>` |
| View Pod logs | `kubectl logs <pod-name>` |
| Delete a Pod | `kubectl delete pod <pod-name>` |

Port forwarding example:

```bash
kubectl port-forward pod/my-app-12345 8080:80
```

Kubernetes recreates the Pod if it is managed by a Deployment or ReplicaSet.

### Edit or Export a Deployment

```bash
kubectl edit deployment <deployment-name>
kubectl get deployment <deployment-name> -o yaml > deployment.yaml
```

### Apply a YAML File

```bash
kubectl apply -f deployment.yaml
```

### Start the Kubernetes API Proxy

```bash
kubectl proxy
```
