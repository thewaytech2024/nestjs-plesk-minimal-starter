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
   - Select Node.js version: **22** (recommended), **20**, or **18**
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
- **npm not found:** Check if Node.js is properly installed in Plesk

**npm Issues:**
If you see "npm: command not found" error:
1. **Check Node.js installation in Plesk:**
   - Go to Plesk → Domains → your-domain → Node.js
   - Ensure Node.js is enabled and version is set (22, 20, or 18)
   - Check "Application Mode" is set to "Production"

2. **Alternative deployment script:**
   - If the main script fails, try using `.plesk-post-deploy-fallback.sh`
   - This script searches for npm in multiple locations

3. **Manual deployment:**
   ```bash
   # SSH into Plesk server
   cd /path/to/application
   /opt/plesk/node/22/bin/npm install
   /opt/plesk/node/22/bin/npm run build
   ```

**Logs:**
- Check Plesk application logs
- Check `plesk-deploy.log` for detailed deployment logs
- Verify startup file path: `dist/main.js`

### 7. Updates

For future updates:
1. Push changes to GitHub
2. Plesk will auto-deploy
3. Check application logs for any issues 