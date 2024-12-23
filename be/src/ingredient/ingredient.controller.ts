import { Controller, Get, Post, Patch, Delete, Param, Body, Query, Put } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { IngredientService } from './ingredient.service';
import { CreateIngredientDto } from './dto/create-ingredient.dto';
import { UpdateIngredientDto } from './dto/update-ingredient.dto';
@Controller('ingredient')
export class IngredientController {
  constructor(private readonly ingredientService: IngredientService) {}

  // @Get() 
  // @ResponseMessage('Get ingredient data successfully')
  // getAllIngredient(@Body() data: any) {
  //   return this.ingredientService.findAll(data);
  // }
  @Get()
  @ResponseMessage('Get ingredient data successfully')
  getAllIngredient(@Query() query: any) {
    // Lấy 'id' từ tham số query
    const { id } = query;
    return this.ingredientService.findAll(id);  // Truyền id cho service
  }
  // @Post()
  // @ResponseMessage('Create ingredient successfully')
  // addIngredient() {
  //   return this.ingredientService.getHello();
  // }
  @Post()
  @ResponseMessage('Create ingredient successfully')
  async addIngredient(@Body() ingredientDto: CreateIngredientDto) {
    // Gọi service để thêm nguyên liệu
    return this.ingredientService.addIngredient(ingredientDto);
    
  }

  // @Patch()
  // @ResponseMessage('Update ingredient data successfully')
  // updateIngredient() {
  //   return this.ingredientService.getHello()
  // }
  // @Patch(":id")
  // @ResponseMessage('Cập nhật nguyên liệu thành công')  // Gửi thông báo thành công
  // async updateIngredient(
  //   @Param('id') id: number,
  //   @Body() updateData: UpdateIngredientDto             // Nhận dữ liệu cập nhật từ body
  // ) {
  //   // Gọi service để cập nhật nguyên liệu
  //   await this.ingredientService.updateIngredient( id, updateData);
  //   return { message: 'Update ingredient data successfully' }; // Trả về thông báo
  // }
  @Put(':id')
  @ResponseMessage('Cập nhật nguyên liệu thành công')  // Gửi thông báo thành công
  async updateIngredient(
    @Param('id') id: number,
    @Body() updateData: UpdateIngredientDto             // Nhận dữ liệu cập nhật từ body
  ) {
    // Gọi service để cập nhật nguyên liệu
    await this.ingredientService.updateIngredient( id, updateData);
    return { message: 'Update ingredient data successfully' }; // Trả về thông báo
  }
  // @Delete(':id')
  // @ResponseMessage('Remove ingredient successfully')
  // removeIngredientWithId(@Param('id') id: string) {
  //   return this.ingredientService.getHello()
  // }
  @Delete(':id')
  @ResponseMessage('Remove ingredient successfully')
  async removeIngredientWithId(@Param('id') id: number) {
    return this.ingredientService.removeIngredient(id);
  }

}
