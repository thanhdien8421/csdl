import { BadRequestException, Injectable } from '@nestjs/common';

import { PrismaService } from 'prisma/prisma.service';

@Injectable()
export class OtherService {
  constructor(
    private prismaService: PrismaService
  ) {}

  async findAll() {
    try {
      const result = await this.prismaService.$queryRaw`SELECT * FROM [dbo].[BanHang]`;
      return result;
    } catch (error) {
      throw new BadRequestException('Error fetching all employers:');
    }
  }

  getHello(): string {
    return 'Hello Meme!';
  }
}
