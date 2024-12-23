import { Module } from '@nestjs/common';
import { SupplierController } from './supplier.controller';
import { SupplierService } from './supplier.service';
import { PrismaService } from 'prisma/prisma.service';

@Module({
  imports: [],
  controllers: [SupplierController],
  providers: [SupplierService, PrismaService],
})
export class SupplierModule {}
