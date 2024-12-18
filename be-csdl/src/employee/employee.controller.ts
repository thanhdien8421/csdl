import { Controller, Get, Post, Patch, Delete, Param, Body, Query, Put } from '@nestjs/common';
import { ResponseMessage } from 'src/decorators/customize';
import { EmployeeService } from './employee.service';
import { CreateEmployeeDto } from './dto/create-employee.dto';
import { UpdateEmployeeDto } from './dto/update-employee.dto';

@Controller('employee')
export class EmployeeController {
  constructor(private readonly employeeService: EmployeeService) {}

  // Lấy danh sách tất cả nhân viên
  @Get()
  @ResponseMessage('Get all employees successfully')
  getAllEmployee(@Query() query: any) {
    const { id } = query;
    return this.employeeService.findAll(id);
  }

  // Lấy thông tin chi tiết của một nhân viên
  @Get(':id')
  @ResponseMessage('Get employee details successfully')
  getEmployeeById(@Param('id') id: number) {
    return this.employeeService.findAll(id);
  }

  // Thêm mới một nhân viên
  @Post()
  @ResponseMessage('Create employee successfully')
  async addEmployee(@Body() employeeDto: CreateEmployeeDto) {
    return this.employeeService.addEmployee(employeeDto);
  }

  // Cập nhật thông tin nhân viên
  @Put(':id')
  @ResponseMessage('Update employee successfully')
  async updateEmployee(
    @Param('id') id: number,
    @Body() updateEmployeeDto: UpdateEmployeeDto,
  ) {
    await this.employeeService.updateEmployee( id, updateEmployeeDto);
    return { message: 'Update ingredient data successfully' };
    
  }

  // Xóa nhân viên theo ID
  @Delete(':id')
  @ResponseMessage('Remove employee successfully')
  removeEmployeeWithId(@Param('id') id: number) {
    return this.employeeService.removeEmployee(id);
  }
}
