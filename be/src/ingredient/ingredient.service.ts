import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { CreateIngredientDto } from './dto/create-ingredient.dto';
import { UpdateIngredientDto } from './dto/update-ingredient.dto';

@Injectable()
export class IngredientService {
  constructor(
    private prismaService: PrismaService
  ) {}

  async findAll( id: any) {
    try {
      const result = await this.prismaService.$queryRaw`SELECT * FROM dbo.GetNguyenLieuNhaCungCapByStoreId(${id})`;
      return result;
    } catch (error) {
      throw new BadRequestException('Error fetching all ingredients:' + id
      );
    }
  }
  async addIngredient(createIngredientDto: CreateIngredientDto) {
    try {
      const result = await this.prismaService.$queryRaw(
        Prisma.sql`
          EXEC dbo.AddNguyenLieuAndNhaCungCap
            ${createIngredientDto.storeId},
            ${createIngredientDto.name},
            ${createIngredientDto.type},
            ${createIngredientDto.buyDate},
            ${createIngredientDto.endDate},
            ${createIngredientDto.number},
            ${createIngredientDto.unit},
            ${createIngredientDto.cost},
            ${createIngredientDto.supplierName},
            ${createIngredientDto.managerId}
        `
      );
      return result[0]?.ingredientId;
    } catch (error) {
      throw new BadRequestException('Error creating ingredient:' + error);
    }
  }
  async removeIngredient(id: number): Promise<boolean> {
    try {
      // Xóa nguyên liệu khỏi cơ sở dữ liệu
      const deleted = await this.prismaService.$queryRaw(
        Prisma.sql`
          EXEC dbo.DeleteNguyenLieu ${id}, ${1}, ${1}
        `);
  
      return true;
    } catch (error) {
      throw new Error('Error deleting ingredient: ' + error.message);
    }
  }


  async updateIngredient( id: number, updateData: UpdateIngredientDto) {
    try {
      // Xóa nguyên liệu khỏi cơ sở dữ liệu
      const deleted = await this.prismaService.$queryRaw(
        Prisma.sql`
          EXEC dbo.UpdateNguyenLieuAndNhaCungCap ${id} ,
          ${updateData.name},
          ${updateData.type},
          ${updateData.buyDate},
          ${updateData.endDate},
          ${updateData.number},
          ${updateData.unit},
          ${updateData.cost},
          ${updateData.supplierName},
          ${updateData.managerId},
          ${1}
        `);
  
      return true;
    } catch (error) {
      throw new Error('Error deleting ingredient: ' + error.message);
    }
  }
  getHello(): string {
    return 'Hello Meme!';
  }
}
