import { Module } from '@nestjs/common';
import { revenueController } from './revenue.controller';
import { revenueService } from './revenue.service';
import { PrismaService } from 'prisma/prisma.service';

@Module({
  imports: [],
  controllers: [revenueController],
  providers: [revenueService, PrismaService],
})
export class revenueModule {}
