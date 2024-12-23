import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'prisma/prisma.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';

@Injectable()
export class ProductService {
  constructor(
    private prismaService: PrismaService
  ) {}

  async findAll(id: number) {
    try {
      const result = await this.prismaService.$queryRaw`SELECT * FROM dbo.GetProductsInStore(${id})`;
      return result;
    } catch (error) {
      throw new BadRequestException('Error fetching all products:');
    }
  }

  getHello(): string {
    return 'Hello Meme!';
  }
}