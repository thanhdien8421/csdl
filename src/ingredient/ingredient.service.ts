import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'prisma/prisma.service';
import { CreateIngredientDto } from './dto/create-ingredient.dto';
import { UpdateIngredientDto } from './dto/update-ingredient.dto';

@Injectable()
export class IngredientService {
  constructor(
    private prismaService: PrismaService
  ) {}

  async findAll() {
    try {
      const result = await this.prismaService.$queryRaw`EXEC [dbo].[GetEmployeeData]`;
      return result;
    } catch (error) {
      throw new BadRequestException('Error fetching all employers:');
    }
  }

  getHello(): string {
    return 'Hello Meme!';
  }
}
