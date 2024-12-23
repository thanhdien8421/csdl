import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'prisma/prisma.service';
import { CreateStoreDto } from './dto/create-store.dto';
import { UpdateStoreDto } from './dto/update-store.dto';

@Injectable()
export class StoreService {
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
