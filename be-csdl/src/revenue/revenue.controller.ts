import { revenueService } from './revenue.service';
import { Controller, Get, Post, Patch, Delete, Param, Body, Query, Put } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
@Controller('revenue')
export class revenueController {
  constructor(private readonly revenueService: revenueService) {}

  @Get()
    @ResponseMessage('Get revenue data successfully')
    getRevenue(@Query() query: any) {
      // Lấy 'id' từ tham số query
      const { id } = query;
      return this.revenueService.findAll(id);  // Truyền id cho service
    }
}
