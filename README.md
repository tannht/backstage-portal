# ACCESSTRADE Backstage Portal

This repository contains the ACCESSTRADE Backstage Portal application. Follow the instructions below to set up the project locally and deploy it to Vercel.

## Table of Contents

- [Local Development](#local-development)
- [Environment Configuration](#environment-configuration)
- [Deploying to Vercel](#deploying-to-vercel)
  - [Method 1: Using Vercel CLI](#method-1-using-vercel-cli)
  - [Method 2: Using Vercel Dashboard](#method-2-using-vercel-dashboard)
- [Deployment Verification](#deployment-verification)
- [Project Configuration](#project-configuration)
- [Troubleshooting](#troubleshooting)

## Local Development

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd backstage-portal
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Start the development server**
   ```bash
   npm run dev
   # or
   yarn dev
   ```

4. **Build for production**
   ```bash
   npm run build
   # or
   yarn build
   ```

## Environment Configuration

Create a `.env.local` file based on the `.env.example` template:

```bash
# API URLs
API_URL=https://api.example.com
# Authentication
AUTH_SECRET=your_auth_secret
# Additional environment variables
```

Ensure all environment variables are properly set before deployment.

## Deploying to Vercel

### Method 1: Using Vercel CLI

1. **Install Vercel CLI globally**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**
   ```bash
   vercel login
   ```

3. **Deploy to Vercel**
   - For development/preview deployment:
     ```bash
     vercel
     ```
   - For production deployment:
     ```bash
     vercel --prod
     ```

   Example successful deployment output:
   ```
   ? Set up and deploy "~\Documents\ACCESSTRADE DEV\ACCESSTRADE\backstage-portal"? yes
   ? Which scope should contain your project? tannht's projects
   ? Found project "tannhts-projects/backstage-portal". Link to it? yes
   🔗  Linked to tannhts-projects/backstage-portal (created .vercel and added it to .gitignore)
   🔍  Inspect: https://vercel.com/tannhts-projects/backstage-portal/8CvubDTgXYwh4g9Lcyyby8XaGGHr [2m]
   ✅  Preview: https://backstage-portal-7tst41tt6-tannhts-projects.vercel.app [2m]
   📝  To deploy to production (backstage-portal.vercel.app), run `vercel --prod`
   ```

4. **Note about project linking**
   - The first deployment will link your local project to Vercel
   - This creates a `.vercel` directory in your project (automatically added to `.gitignore`)
   - Subsequent deployments will detect the existing link

### Method 2: Using Vercel Dashboard

1. **Push your code to a Git repository** (GitHub, GitLab, or Bitbucket)

2. **Import your project to Vercel**
   - Go to [Vercel Dashboard](https://vercel.com/dashboard)
   - Click "Import Project"
   - Choose "Import Git Repository" and select your repository
   - Configure the project settings:
     - Build Command: `npm run build` or `yarn build`
     - Output Directory: Typically `build`, `dist`, or `out` (depends on your framework)
     - Development Command: `npm run dev` or `yarn dev`

3. **Configure Environment Variables**
   - In the Vercel dashboard, go to your project settings
   - Navigate to the "Environment Variables" tab
   - Add all variables from your `.env.example` file with appropriate values

4. **Deploy**
   - Click "Deploy" to deploy your application

## Deployment Verification

After deploying your project, you can verify and manage it:

1. **Preview vs Production**
   - Preview deployments (from `vercel` command) create temporary URLs for testing
   - Production deployments (from `vercel --prod`) update your main domain

2. **Checking deployment status**
   - Visit the Inspect URL provided in the deployment output
   - Or go to your [Vercel Dashboard](https://vercel.com/dashboard) and select your project

3. **Accessing deployment logs**
   - Go to the specific deployment in your Vercel Dashboard
   - Click on "Functions" or "Logs" to view detailed logs
   - Use these logs to troubleshoot any issues

4. **Build configuration notice**
   - If you're using a custom `vercel.json` file with `builds` defined, Vercel will display this warning:
     ```
     ❗️  Due to `builds` existing in your configuration file, the Build and Development Settings 
     defined in your Project Settings will not apply. Learn More: https://vercel.link/unused-build-settings
     ```
   - This is expected behavior as your custom configuration takes precedence over dashboard settings

## Project Configuration

The project includes a `vercel.json` configuration file that defines how Vercel should build and serve the application:

```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/"
    }
  ]
}
```

This configuration tells Vercel to:
- Use the Node.js builder for the project
- Route all requests to the root application

## Troubleshooting

- **Build Failures**: Check build logs in Vercel dashboard for specific errors
- **API Connection Issues**: Verify that environment variables are correctly set
- **Deployment Errors**: Ensure your `vercel.json` configuration is appropriate for your project type
- **Preview vs Production**: If changes aren't showing in production but appear in preview, ensure you've run `vercel --prod`
- **Domain Configuration**: To use a custom domain, configure it in the Vercel Dashboard under your project's "Domains" settings

For additional help, refer to the [Vercel Documentation](https://vercel.com/docs) or open an issue in this repository.
