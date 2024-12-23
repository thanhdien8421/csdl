import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'prisma/prisma.service';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderDto } from './dto/update-order.dto';
import { Prisma } from '@prisma/client';

@Injectable()
export class OrderService {
  constructor(
    private prismaService: PrismaService
  ) {}
  async create(createOrderDto: CreateOrderDto) {
    try {
      const result = await this.prismaService.$queryRaw(
        Prisma.sql`
          EXEC [dbo].[ThemDonHang]
          @salerId = ${createOrderDto.salerId},
          @storeId = ${createOrderDto.storeId},
          @paymentMethod = ${createOrderDto.paymentMethod},
          @productIds = ${createOrderDto.productIds},
          @quantities = ${createOrderDto.quantities}
        `
      );
      return result;
    } catch (error) {
      throw new BadRequestException('Error creating order:' + error);
    }
  }
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
