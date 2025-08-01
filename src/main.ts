import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  // Enable CORS for web applications
  app.enableCors();
  
  // Get port from environment variable or default to 3000
  const port = process.env.PORT || 3000;
  
  // Bind to 0.0.0.0 to accept connections from any IP (required for Plesk)
  await app.listen(port, '0.0.0.0');
  
  console.log(`🚀 Application is running on: http://0.0.0.0:${port}`);
  console.log(`📝 Environment: ${process.env.NODE_ENV || 'development'}`);
}
bootstrap(); 