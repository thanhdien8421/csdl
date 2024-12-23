import { Controller, Get, Post, Patch, Delete, Param, Body } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { StoreService } from './store.service';

@Controller('store')
export class StoreController {
  constructor(private readonly storeService: StoreService) {}

  @Get()
  @ResponseMessage('Get store data successfully')
  getAllStore() {
    return this.storeService.findAll();
  }

  @Post()
  @ResponseMessage('Create store successfully')
  addStore() {
    return this.storeService.getHello();
  }

  @Patch()
  @ResponseMessage('Update store data successfully')
  updateStore() {
    return this.storeService.getHello()
  }

  @Delete(':id')
  @ResponseMessage('Remove store successfully')
  removeStoreWithId(@Param('id') id: string) {
    return this.storeService.getHello()
  }
}
