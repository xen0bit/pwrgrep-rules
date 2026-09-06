// nestjs-header-cors-any: '*' lets any site read the response, so a victim
// visiting an attacker's page leaks the API's data. Name the origin instead.
import { Controller, Get, Header } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';

export function setup(app: any): void {
  // ruleid: nestjs-header-cors-any
  app.enableCors();
}

@Controller('open')
// ruleid: nestjs-header-cors-any
export class OpenController {
  @Header('Access-Control-Allow-Origin', '*')
  @Get()
  findAll() {
    return 'all';
  }
}

@Controller('open2')
// ruleid: nestjs-header-cors-any
export class Open2Controller {
  @Header('Access-Control-Allow-Origin', '*')
  @Get()
  findAll() {
    return 'all';
  }
}

export function setupStrict(app: any): void {
  // ok: nestjs-header-cors-any
  app.enableCors({ origin: 'https://example.com' });
}

// ok: nestjs-header-cors-any
@Controller('closed')
export class ClosedController {
  @Header('Access-Control-Allow-Origin', 'https://example.com')
  @Get()
  findAll() {
    return 'all';
  }
}

export function bootstrap(module: any): void {
  // ok: nestjs-header-cors-any
  NestFactory.create(module);
}
