import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { CreateEmployeeDto } from './dto/create-employee.dto';
import { UpdateEmployeeDto } from './dto/update-employee.dto';

@Injectable()
export class EmployeeService {
  constructor(
    private readonly prismaService: PrismaService) {}

  // Lấy danh sách tất cả nhân viên theo storeId
  async findAll( id?: number) {
    try {
      const result = await this.prismaService.$queryRaw`SELECT * FROM dbo.GetEmployeesByStore(${id})`; 
      return result;
    } catch (error) {
      throw new BadRequestException(
        'Error fetching all employees: ' + id
      );
    }
  }

  // Lấy chi tiết nhân viên từ hàm SQL GetEmployeeFullInfo
  async getEmployeeById(employeeId: number) {
    try {
      const result = await this.prismaService.$queryRaw(
        Prisma.sql`SELECT * FROM dbo.GetEmployeeFullInfo(${employeeId})`,
      );
      return result[0] || {};
    } catch (error) {
      throw new BadRequestException(
        'Error fetching employee details: ' + error.message,
      );
    }
  }

  // Thêm mới nhân viên
  async addEmployee(createEmployeeDto: CreateEmployeeDto) {
    try {
      const result = await this.prismaService.$queryRaw(
        Prisma.sql`
        EXEC dbo.AddEmployee 
          ${createEmployeeDto.name},
          ${createEmployeeDto.birthday},
          ${createEmployeeDto.salary},
          ${createEmployeeDto.phone},
          ${createEmployeeDto.role},
          ${createEmployeeDto.dayOff},
          ${createEmployeeDto.storeId},
          ${createEmployeeDto.degree},
          ${createEmployeeDto.trainingTime},
          ${createEmployeeDto.kinhNghiem}
          `
      );
      return result[0]?.employeeId;
    } catch (error) {
      throw new BadRequestException('Error creating :' + error);
    }
  }

  // Cập nhật thông tin nhân viên
  async updateEmployee(id: number, updateEmployeeDto: UpdateEmployeeDto) {
    try {
      const deleted = await this.prismaService.$queryRaw(
        Prisma.sql`
        EXEC dbo.GetEmployeeFullInfo 
          ${id},
          ${updateEmployeeDto.name},
          ${updateEmployeeDto.birthday},
          ${updateEmployeeDto.salary},
          ${updateEmployeeDto.phone},
          ${updateEmployeeDto.role},
          ${updateEmployeeDto.dayOff},
          ${updateEmployeeDto.degree},
          ${updateEmployeeDto.trainingTime},
          ${updateEmployeeDto.kinhNghiem}
          `);
      return true;
    } catch (error) {
      throw new Error('Error deleting employee: ' + error.message);
        
    }
  }

  // Xóa nhân viên
  async removeEmployee(id: number): Promise<{ message: string }> {
    try {
      await this.prismaService.$queryRaw(
        Prisma.sql`EXEC dbo.GetEmployeeFullInfo ${id}`,
      );
      return { message: 'Employee removed successfully' };
    } catch (error) {
      throw new BadRequestException(
        'Error deleting employee: ' + error.message,
      );
    }
  }
}
