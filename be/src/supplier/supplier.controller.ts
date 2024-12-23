import { Controller, Get, Post, Patch, Delete, Param, Body } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { SupplierService } from './supplier.service';

@Controller('supplier')
export class SupplierController {
  constructor(private readonly supplierService: SupplierService) {}

  @Get()
  @ResponseMessage('Get supplier data successfully')
  getAllSupplier() {
    return this.supplierService.findAll();
  }

  @Post()
  @ResponseMessage('Create supplier successfully')
  addSupplier() {
    return this.supplierService.getHello();
  }

  @Patch()
  @ResponseMessage('Update supplier data successfully')
  updateSupplier() {
    return this.supplierService.getHello()
  }

  @Delete(':id')
  @ResponseMessage('Remove supplier successfully')
  removeSupplierWithId(@Param('id') id: string) {
    return this.supplierService.getHello()
  }
}
