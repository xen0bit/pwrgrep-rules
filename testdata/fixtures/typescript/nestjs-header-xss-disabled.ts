// nestjs-header-xss-disabled: setting X-XSS-Protection to 0 switches off
// the browser's reflected-XSS filter. Leave the header out or set it to 1.
import { Controller, Get, Header } from '@nestjs/common';

@Controller('a')
// ruleid: nestjs-header-xss-disabled
export class AController {
  @Header('X-XSS-Protection', '0')
  @Get()
  findAll() {
    return 'all';
  }
}

@Controller('b')
// ruleid: nestjs-header-xss-disabled
export class BController {
  @Header('X-XSS-Protection', '0')
  @Get()
  findAll() {
    return 'all';
  }
}

// ok: nestjs-header-xss-disabled
@Controller('c')
export class CController {
  @Header('X-XSS-Protection', '1; mode=block')
  @Get()
  findAll() {
    return 'all';
  }
}

// ok: nestjs-header-xss-disabled
@Controller('d')
export class DController {
  @Header('Content-Type', 'application/json')
  @Get()
  findAll() {
    return 'all';
  }
}
