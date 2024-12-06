import { Controller, Get, Post, Patch, Delete, Param, Body } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { EmployeeService } from './employee.service';

@Controller('employee')
export class EmployeeController {
  constructor(private readonly employeeService: EmployeeService) {}

  @Get()
  @ResponseMessage('Get employee data successfully')
  getAllEmployee() {
    return this.employeeService.findAll();
  }

  @Post()
  @ResponseMessage('Create employee successfully')
  addEmployee() {
    return this.employeeService.getHello();
  }

  @Patch()
  @ResponseMessage('Update employee data successfully')
  find() {
    return this.employeeService.getHello()
  }

  @Delete(':id')
  @ResponseMessage('Remove employee successfully')
  removeEmployerWithId(@Param('id') id: string) {
    return this.employeeService.getHello()
  }
}
