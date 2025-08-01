# NestJS Plesk Minimal Starter

A lightweight NestJS backend project optimized for Plesk deployment on `member-api-dev.thaibible.or.th`.

## 🚀 Quick Start

### Local Development

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Start development server:**
   ```bash
   npm run start:dev
   ```

3. **Build for production:**
   ```bash
   npm run build
   ```

4. **Start production server:**
   ```bash
   npm run start:prod
   ```

## 📁 Project Structure

```
├── src/
│   ├── app.controller.ts    # Main controller (returns "Hello World!")
│   ├── app.module.ts        # Root application module
│   └── main.ts             # Application entry point
├── .plesk-post-deploy.sh   # Plesk post-deployment script
├── package.json            # Dependencies and scripts
├── tsconfig.json           # TypeScript configuration
└── README.md              # This file
```

## 🌐 API Endpoints

- `GET /` - Returns "Hello World!"
- `GET /health` - Health check endpoint
- `GET /test` - Test endpoint returning `{status: 1000}`

## 🚀 Plesk Deployment

### Prerequisites

1. **Node.js Version:** Ensure Plesk has Node.js 18 or 20 installed
2. **Git Repository:** Push this project to a GitHub repository

### Plesk Configuration

1. **Create Domain/Subdomain:**
   - Domain: `member-api-dev.thaibible.or.th`
   - Document Root: `public/` (can be empty)
   - Application Root: Project folder

2. **Node.js Application Settings:**
   - **Startup File:** `dist/main.js`
   - **Node.js Version:** 18 or 20
   - **Application Mode:** Production

3. **Git Integration:**
   - Enable Git integration in Plesk
   - Set repository URL
   - Configure auto-deploy on push

### Deployment Process

1. **Automatic (via Git):**
   - Push to GitHub repository
   - Plesk automatically pulls changes
   - `.plesk-post-deploy.sh` script runs automatically

2. **Manual Deployment:**
   ```bash
   # SSH into Plesk server
   cd /path/to/application
   npm install
   npm run build
   ```

## ⚙️ Environment Variables

Create a `.env` file in the project root:

```env
PORT=3000
NODE_ENV=production
```

## 🔧 Available Scripts

- `npm run build` - Build the application
- `npm run start` - Start the application
- `npm run start:dev` - Start in development mode with hot reload
- `npm run start:prod` - Build and start in production mode
- `npm run test` - Run tests
- `npm run lint` - Run ESLint

## 📝 Notes

- **Port Binding:** Application binds to `0.0.0.0` to accept connections from any IP
- **CORS:** Enabled for web application compatibility
- **Build Output:** Compiled to `dist/main.js` for Plesk execution
- **Health Check:** Available at `/health` endpoint

## 🐛 Troubleshooting

### Common Issues

1. **Port Already in Use:**
   - Check if another application is using port 3000
   - Change PORT in environment variables

2. **Build Failures:**
   - Ensure Node.js version is 18 or 20
   - Clear `node_modules` and reinstall: `rm -rf node_modules && npm install`

3. **Plesk Deployment Issues:**
   - Check Plesk error logs
   - Verify startup file path: `dist/main.js`
   - Ensure `.plesk-post-deploy.sh` is executable

### Logs

- Application logs are available in Plesk's application management panel
- Check Plesk's error logs for deployment issues

## 📞 Support

For deployment issues, check:
1. Plesk application logs
2. Node.js version compatibility
3. File permissions on `.plesk-post-deploy.sh` 