import { Controller, Get, Post, Patch, Delete, Param, Body } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { IngredientService } from './ingredient.service';

@Controller('ingredient')
export class IngredientController {
  constructor(private readonly ingredientService: IngredientService) {}

  @Get()
  @ResponseMessage('Get ingredient data successfully')
  getAllIngredient() {
    return this.ingredientService.findAll();
  }

  @Post()
  @ResponseMessage('Create ingredient successfully')
  addIngredient() {
    return this.ingredientService.getHello();
  }

  @Patch()
  @ResponseMessage('Update ingredient data successfully')
  updateIngredient() {
    return this.ingredientService.getHello()
  }

  @Delete(':id')
  @ResponseMessage('Remove ingredient successfully')
  removeIngredientWithId(@Param('id') id: string) {
    return this.ingredientService.getHello()
  }
}
