"use client";
import React, { useState, useEffect, FormEvent } from "react";
import { FiUsers, FiEdit2, FiTrash2, FiPlus, FiSearch } from "react-icons/fi";
import axios from "axios";
// Define the structure of an employee object
interface Employee {
  EmployeeId: number;
  EmployeeName: string;
  EmployeeBirthday: string;
  EmployeeSalary: string;
  EmployeeStartDate: string;
  EmployeePhone: string;
  EmployeeRole: string;
  EmployeeDayOff: string;
  Degree: string;
  TrainingTime: string;
  Experience: string;
  RoleInCooking: string;
}

const EmployeeDataPage: React.FC = () => {
  const [employees, setEmployees] = useState<Employee[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [searchQuery, setSearchQuery] = useState<string>("");
  const [showModal, setShowModal] = useState<boolean>(false);
  const [currentEmployee, setCurrentEmployee] = useState<Employee | null>(null);
  const [formData, setFormData] = useState<Employee>({
    EmployeeId: 0,
  EmployeeName: "",
  EmployeeBirthday: "",
  EmployeeSalary: "",
  EmployeeStartDate: "",
  EmployeePhone: "",
  EmployeeRole: "",
  EmployeeDayOff: "",
  Degree: "",
  TrainingTime: "",
  Experience: "",
  RoleInCooking: "",
  });

  useEffect(() => {
    fetchEmployees();
  }, []);

  const fetchEmployees = async () => {
    try {
      const response = await axios.get(`http://localhost:8000/api/employee/${1}`);
      if (!response) throw new Error("Failed to fetch employees");
      const data: Employee[] = await response.data.data;
      setEmployees(data);
      setLoading(false);
    } catch {
      setLoading(false);
    }
  };

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    try {
      const url = currentEmployee
        ? `http://localhost:8000/api/employee/${currentEmployee.EmployeeId}`
        : "http://localhost:8000/api/employee";
      const method = currentEmployee ? "PUT" : "POST";

      const response = await fetch(url, {
        method,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData),
      });

      if (!response.ok) throw new Error("Failed to save employee");
      fetchEmployees();
      setShowModal(false);
      resetForm();
    } catch {
      console.error("Failed to save employee");
    }
  };

  const handleDelete = async (id: number) => {
    if (window.confirm("Are you sure you want to delete this employee?")) {
      try {
        const response = await fetch(`http://localhost:8000/api/employee/${id}`, {
          method: "DELETE",
        });
        if (!response.ok) throw new Error("Failed to delete employee");
        fetchEmployees();
      } catch {
        console.error("Failed to delete employee");
      }
    }
  };

  const handleEdit = (employee: Employee) => {
    setCurrentEmployee(employee);
    setFormData(employee);
    setShowModal(true);
  };

  const resetForm = () => {
    setCurrentEmployee(null);
    setFormData({
      EmployeeId: 0,
  EmployeeName: "",
  EmployeeBirthday: "",
  EmployeeSalary: "",
  EmployeeStartDate: "",
  EmployeePhone: "",
  EmployeeRole: "",
  EmployeeDayOff: "",
  Degree: "",
  TrainingTime: "",
  Experience: "",
  RoleInCooking: "",
    });
  };

  const filteredEmployees = employees.filter(employee =>
    Object.values(employee).some(value =>
      String(value).toLowerCase().includes(searchQuery.toLowerCase())
    )
  );

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-100 flex items-center justify-center">
        <div className="text-xl text-gray-600">Loading...</div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-100 py-8 px-4 sm:px-6 lg:px-8">
      <header className="mb-8">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-between">
            <div className="flex items-center">
              <FiUsers className="h-8 w-8 text-indigo-600" />
              <h1 className="ml-3 text-3xl font-bold text-gray-900">Employee Data</h1>
            </div>
            <div className="flex items-center space-x-4">
              <div className="relative">
                <input
                  type="text"
                  placeholder="Search employees..."
                  className="w-64 px-4 py-2 rounded-lg border focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                />
                <FiSearch className="absolute right-3 top-3 text-gray-400" />
              </div>
              <button
                onClick={() => setShowModal(true)}
                className="bg-indigo-600 text-white px-4 py-2 rounded-lg flex items-center"
              >
                <FiPlus className="mr-2" /> Add Employee
              </button>
            </div>
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto">
        <div className="bg-white shadow-xl rounded-lg overflow-hidden">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  {[
                    "ID",
                    "Name",
                    "Birthday",
                    "Salary",
                    "Start Date",
                    "Phone",
                    "Role",
                    "Day Off",
                    "Degree",
                    "Training Time",
                    "Experience",
                    "Role In Cooking",
                    "Actions"
                  ].map((header) => (
                    <th
                      key={header}
                      scope="col"
                      className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                    >
                      {header}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {filteredEmployees.map((employee, index) => (
                  <tr
                    key={employee.EmployeeId}
                    className={index % 2 === 0 ? "bg-white" : "bg-gray-50"}
                  >
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {employee.EmployeeId}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                      {employee.EmployeeName}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.EmployeeBirthday}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.EmployeeSalary}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.EmployeeStartDate}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.EmployeePhone}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      <span className="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-indigo-100 text-indigo-800">
                        {employee.EmployeeRole}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.EmployeeDayOff}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.Degree}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.TrainingTime}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.Experience}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {employee.RoleInCooking}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      <div className="flex space-x-2">
                        <button
                          onClick={() => handleEdit(employee)}
                          className="text-indigo-600 hover:text-indigo-900"
                        >
                          <FiEdit2 />
                        </button>
                        <button
                          onClick={() => handleDelete(employee.EmployeeId)}
                          className="text-red-600 hover:text-red-900"
                        >
                          <FiTrash2 />
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </main>

      {showModal && (
        <div className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
          <div className="bg-white rounded-lg shadow-lg w-full max-h-[90vh] overflow-y-auto sm:w-96 p-6">
            <h2 className="text-xl font-semibold mb-4">
              {currentEmployee ? "Edit Employee" : "Add Employee"}
            </h2>
            <form onSubmit={handleSubmit}>
              {Object.keys(formData).map((key) => (
                <div key={key} className="mb-4">
                  <label
                    htmlFor={key}
                    className="block text-sm font-medium text-gray-700"
                  >
                    {key.charAt(0).toUpperCase() + key.slice(1)}
                  </label>
                  <input
                    id={key}
                    type="text"
                    name={key}
                    className="w-full px-3 py-2 border border-gray-300 rounded-md"
                    value={formData[key as keyof Employee]}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        [key]: e.target.value,
                      })
                    }
                  />
                </div>
              ))}
              <div className="flex justify-end space-x-2">
                <button
                  type="button"
                  onClick={() => {
                    setShowModal(false);
                    resetForm();
                  }}
                  className="text-gray-600"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  className="bg-indigo-600 text-white px-4 py-2 rounded-lg"
                >
                  {currentEmployee ? "Save Changes" : "Add Employee"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
};

export default EmployeeDataPage;
