import { BadRequestException, Injectable } from '@nestjs/common';

import { PrismaService } from 'prisma/prisma.service';

@Injectable()
export class revenueService {
  constructor(
    private prismaService: PrismaService
  ) {}

  async findAll(id: number) {
    try {
      const result = await this.prismaService.$queryRaw`EXEC GetMonthlyRevenueByStore ${id}`;
      return result;
    } catch (error) {
      throw new BadRequestException('Error fetching all revenue:');
    }
  }

  getHello(): string {
    return 'Hello Meme!';
  }
}
