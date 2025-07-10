import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('https://playwright.dev/');
  await page.getByRole('link', { name: 'Playwright logo Playwright' }).click();
  await expect(page.getByRole('link', { name: 'API' })).toBeVisible();
});