import { Module } from '@nestjs/common';
import { OtherController } from './other.controller';
import { OtherService } from './other.service';
import { PrismaService } from 'prisma/prisma.service';

@Module({
  imports: [],
  controllers: [OtherController],
  providers: [OtherService, PrismaService],
})
export class OtherModule {}
