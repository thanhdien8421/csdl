import { Controller, Get, Post, Patch, Delete, Param, Body } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { OrderService } from './order.service';

@Controller('order')
export class OrderController {
  constructor(private readonly orderService: OrderService) {}

  @Get()
  @ResponseMessage('Get order data successfully')
  getAllOrder() {
    return this.orderService.findAll();
  }

  @Post()
  @ResponseMessage('Create order successfully')
  addOrder() {
    return this.orderService.getHello();
  }

  @Patch()
  @ResponseMessage('Update order data successfully')
  updateOrder() {
    return this.orderService.getHello()
  }

  @Delete(':id')
  @ResponseMessage('Remove order successfully')
  removeOrderWithId(@Param('id') id: string) {
    return this.orderService.getHello()
  }
}
