// nestjs-open-redirect: {url: userInput} under @Redirect sends the client
// wherever the caller names. Redirect to a constant or an allowlisted path.
import { Controller, Get, Redirect } from '@nestjs/common';

@Controller('go')
export class GoController {
  @Redirect()
  @Get()
  go(target: string) {
    // ruleid: nestjs-open-redirect
    return { url: target };
  }
}

@Controller('jump')
export class JumpController {
  @Redirect()
  @Get()
  jump(next: string) {
    const dest = next;
    // ruleid: nestjs-open-redirect
    return { url: dest };
  }
}

// ok: nestjs-open-redirect
@Controller('home')
export class HomeController {
  @Redirect('https://example.com/home')
  @Get()
  home() {
    return { url: 'https://example.com/home' };
  }
}

// ok: nestjs-open-redirect
@Controller('plain')
export class PlainController {
  @Get()
  show() {
    return { url: 'https://example.com/plain' };
  }
}
