# 🚀 Plesk Deployment Guide

## Quick Setup for `member-api-dev.thaibible.or.th`

### 1. GitHub Repository Setup

1. **Push this project to GitHub:**
   ```bash
   git add .
   git commit -m "Initial NestJS Plesk setup"
   git push origin main
   ```

### 2. Plesk Configuration

#### Domain Setup
1. **Create Subdomain:**
   - Domain: `member-api-dev.thaibible.or.th`
   - Document Root: `public/`
   - Application Root: Project folder

#### Node.js Application
1. **Enable Node.js:**
   - Go to "Node.js" in Plesk
   - Select Node.js version: **18** or **20**
   - Startup File: `dist/main.js`
   - Application Mode: **Production**

#### Git Integration
1. **Configure Git:**
   - Enable Git integration
   - Set repository URL: `https://github.com/YOUR_USERNAME/nestjs-plesk-minimal-starter.git`
   - Branch: `main`
   - Auto-deploy: **Enabled**

### 3. Environment Variables

In Plesk Node.js settings, add:
```
PORT=3000
NODE_ENV=production
```

### 4. Deployment Process

The `.plesk-post-deploy.sh` script will automatically:
1. Run `npm install`
2. Run `npm run build`
3. Restart the application

### 5. Verification

After deployment, test:
- `https://member-api-dev.thaibible.or.th/` → "Hello World!"
- `https://member-api-dev.thaibible.or.th/health` → Health status
- `https://member-api-dev.thaibible.or.th/test` → `{"status":1000}`

### 6. Troubleshooting

**Common Issues:**
- **Port conflicts:** Check if port 3000 is available
- **Build failures:** Verify Node.js version (18 or 20)
- **Permission errors:** Ensure `.plesk-post-deploy.sh` is executable

**Logs:**
- Check Plesk application logs
- Verify startup file path: `dist/main.js`

### 7. Updates

For future updates:
1. Push changes to GitHub
2. Plesk will auto-deploy
3. Check application logs for any issues 