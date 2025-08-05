import { Controller, Get } from '@nestjs/common';

@Controller()
export class AppController {
  @Get()
  getHello(): string {
    return 'Hello World!';
  }

  @Get('health')
  getHealth(): { status: string; timestamp: string } {
    return {
      status: 'ok',
      timestamp: new Date().toISOString(),
    };
  }

  @Get('test')
  getTest(): { status: number } {
    return {
      status: 1000,
    };
  }

  @Get('test2')
  getTest2(): { status: number } {
    return {
      status: 2000,
    };
  }

  @Get('test3')
  getTest3(): { status: number } {
    return {
      status: 3000,
    };
  }

  @Get('test4')
  getTest4(): { status: number } {
    return {
      status: 4000,
    };
  }
} 
