import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(
    AppModule,
  );

  // config service for env
  const configService = app.get(ConfigService);

  // config cors
  app.enableCors({
    origin: true,
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    allowedHeaders: 'Content-Type, Accept',
    credentials: true,
  });

  // config versioning
  app.setGlobalPrefix('api');
 
  await app.listen(configService.get<string>('PORT'), () => {
    console.log(`Server is running at http://localhost:${configService.get<string>('PORT')}`);
  });
}
bootstrap();
