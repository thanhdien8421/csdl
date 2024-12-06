import { Module } from '@nestjs/common';
import { IngredientController } from './ingredient.controller';
import { IngredientService } from './ingredient.service';
import { PrismaService } from 'prisma/prisma.service';

@Module({
  imports: [],
  controllers: [IngredientController],
  providers: [IngredientService, PrismaService],
})
export class IngredientModule {}
