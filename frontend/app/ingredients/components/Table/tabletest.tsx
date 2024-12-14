"use client"
import { FC, useState, useRef, useEffect } from 'react';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Button } from 'primereact/button';
// import { Dialog } from 'primereact/dialog';
import Dialog from './Dialog';
import { InputText } from 'primereact/inputtext';
import { Toast } from 'primereact/toast';
import 'primereact/resources/themes/lara-light-indigo/theme.css';  // Chọn theme của PrimeReact
import 'primereact/resources/primereact.min.css';
import 'primeicons/primeicons.css';
import axios from 'axios';
import { z } from 'zod';


// Định nghĩa schema với Zod
// eslint-disable-next-line @typescript-eslint/no-unused-vars
const materialSchema = z.object({
  id: z.number(),
  name: z.string().min(1, { message: "Tên nguyên vật liệu không được để trống!" }),
  type: z.string().min(1, { message: "Loại nguyên vật liệu không được để trống!" }),
  buyDate: z.string().min(1, { message: "Ngày mua không được để trống!" }),
  endDate: z.string().min(1, { message: "Ngày hết hạn không được để trống!" }),
  number: z.number().positive({ message: "Số lượng phải lớn hơn 0!" }),
  unit: z.string().min(1, { message: "Phải có đơn vị" }),
  cost: z.number().positive({ message: "Giá phải lớn hơn 0!" }),
  supplierName: z.string().min(1, { message: "Nhà cung cấp không được để trống!" }),
});

type Material = z.infer<typeof materialSchema>;
interface addMaterial {
  id: number;
  name: string;
  type: string;
  buyDate: string;
  endDate: string;
  number: number;
  unit: string;
  cost: number;
  supplierName: string;
  storeId: number;
}
interface Materialfeachted {
  NguyenLieuId: number;
  NguyenLieuName: string;
  NguyenLieuType: string;
  NguyenLieuBuyDate: string;
  NguyenLieuEndDate: string;
  NguyenLieuNumber: number;
  NguyenLieuUnit: string;
  NguyenLieuCost: number;
  NhaCungCapName: string;
}

const Materials: FC = () => {
  const [materials, setMaterials] = useState<Material[]>([
    { id: 1, name: 'Nguyên liệu A', type: 'Loại 1', buyDate: '2024-01-01', endDate: '2025-01-01', number: 100, unit: 'kg', cost: 500, supplierName: 'Nhà cung cấp A' },
    { id: 2, name: 'Nguyên liệu B', type: 'Loại 2', buyDate: '2024-02-01', endDate: '2025-02-01', number: 200, unit: 'kg', cost: 300, supplierName: 'Nhà cung cấp B' },
    { id: 3, name: 'Nguyên liệu C', type: 'Loại 3', buyDate: '2024-03-01', endDate: '2025-03-01', number: 150, unit: 'kg', cost: 700, supplierName: 'Nhà cung cấp C' },
  ]);
  const [dialogVisible, setDialogVisible] = useState(false);
  const [newMaterial, setNewMaterial] = useState<addMaterial>({
    id: 0,
    name: '',
    type: '',
    buyDate: '',
    endDate: '',
    number: 0,
    unit: '',
    cost: 0,
    supplierName: '',
    storeId: 0,
  });
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedMaterials, setSelectedMaterials] = useState<Material[]>([]);
  const [editingMaterial, setEditingMaterial] = useState<Material | null>(null);
  const toast = useRef<Toast>(null);

  // Lấy dữ liệu nguyên liệu từ API khi component được mount
  useEffect(() => {
    const fetchMaterials = async () => {
      try {
        // Sử dụng GET và gửi id qua URL (thông qua tham số query)
        console.log('Fetching materials...');
        const response = await axios.get('http://localhost:8000/api/ingredient', {
          params: { id: 1 },  // Thêm id vào URL dưới dạng tham số query
        });
  
        // Giả sử dữ liệu trả về là một mảng nguyên liệu với các key không khớp
        const rawMaterials = response.data.data; // Dữ liệu thô trả về từ API
  
        // Map lại key để khớp với state của bạn
        const mappedMaterials = rawMaterials.map((material: Materialfeachted) => ({
          id: material.NguyenLieuId,          // Đổi tên 'NguyenLieuId' thành 'id'
          name: material.NguyenLieuName,      // Đổi tên 'NguyenLieuName' thành 'name'
          type: material.NguyenLieuType,      // Đổi tên 'NguyenLieuType' thành 'type'
          buyDate: new Date(material.NguyenLieuBuyDate).toLocaleDateString('vi-VN'), // Đổi tên 'NguyenLieuBuyDate' thành 'buyDate'
          endDate: new Date(material.NguyenLieuEndDate).toLocaleDateString('vi-VN'), // Đổi tên 'NguyenLieuEndDate' thành 'endDate'
          number: material.NguyenLieuNumber,  // Đổi tên 'NguyenLieuNumber' thành 'number' và chuyển sang kiểu số
          unit: material.NguyenLieuUnit,      // Đổi tên 'NguyenLieuUnit' thành 'unit'
          cost: material.NguyenLieuCost,      // Đổi tên 'NguyenLieuCost' thành 'cost'
          supplierName: material.NhaCungCapName, // Đổi tên 'NhaCungCapName' thành 'supplierName'
        }));
  
        setMaterials(mappedMaterials); // Cập nhật dữ liệu nguyên liệu với key đúng
        console.log('Fetching materials success:', mappedMaterials);
      } catch (error) {
        console.error('Error fetching materials:', error);
        toast.current?.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể tải dữ liệu nguyên liệu', life: 3000 });
      }
    };
  
    fetchMaterials();
  }, []); // Chạy chỉ một lần khi component mount
  const isValidMaterial = (material: Material) => {
    try {
      materialSchema.parse(material);
      return true;
    } catch (error: unknown) {
      if (error instanceof z.ZodError) {
        error.errors.forEach((err: { message: string }) => {
          toast.current?.show({ severity: 'error', summary: 'Lỗi', detail: err.message, life: 3000 });
        });
      } else {
        console.error(error);
      }
      return false;
    }
  };
  // const addMaterial = () => {
  //   if (!isValidMaterial(newMaterial)) return;
  //   const newId = materials.length > 0 ? materials[materials.length - 1].id + 1 : 1;
  //   const materialToAdd = { ...newMaterial, id: newId };
  //   setMaterials([...materials, materialToAdd]);
  //   setDialogVisible(false);
  //   setNewMaterial({
  //     id: 0,
  //     name: '',
  //     type: '',
  //     buyDate: '',
  //     endDate: '',
  //     number: 0,
  //     unit: '',
  //     cost: 0,
  //     supplierName: '',
  //   });
  //   toast.current?.show({ severity: 'success', summary: 'Thêm mới thành công', detail: 'Nguyên liệu đã được thêm', life: 3000 });
  // };
  const addMaterial = async () => {
    if (!isValidMaterial(newMaterial)) return;
    
    try {
      const response = await axios.post('http://localhost:8000/api/ingredient', 
        {
          storeId: newMaterial.storeId,
          name: newMaterial.name,
          type: newMaterial.type,
          buyDate: newMaterial.buyDate,
          endDate: newMaterial.endDate,
          number: newMaterial.number,
          unit: newMaterial.unit,
          cost: newMaterial.cost,
          supplierName: newMaterial.supplierName          
        }); // Gửi dữ liệu tới backend
      const addedMaterial = response.data.data; // Dữ liệu nguyên liệu mới thêm từ server
      setMaterials([...materials, { ...newMaterial, id: addedMaterial } ]); // Cập nhật danh sách nguyên liệu với nguyên liệu mới thêm
      setDialogVisible(false);
      setNewMaterial({
        id: 0,
        name: '',
        type: '',
        buyDate: '',
        endDate: '',
        number: 0,
        unit: '',
        cost: 0,
        supplierName: '',
        storeId: 0,
      });
      toast.current?.show({ severity: 'success', summary: 'Thêm mới thành công', detail: 'Nguyên liệu đã được thêm', life: 3000 });
    } catch (error) {
      console.error('Error adding material:', error);
      toast.current?.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể thêm nguyên liệu', life: 3000 });
    }
  };

  const editMaterial = (material: Material) => {
    setEditingMaterial(material);
    setDialogVisible(true);
  };

  // const saveMaterial = () => {
  //   if (editingMaterial && !isValidMaterial(editingMaterial)) return;
  //   if (editingMaterial) {
  //     setMaterials(
  //       materials.map((material) =>
  //         material.id === editingMaterial.id ? editingMaterial : material
  //       )
  //     );
  //     setEditingMaterial(null);
  //     setDialogVisible(false);
  //     toast.current?.show({ severity: 'success', summary: 'Cập nhật thành công', detail: 'Thông tin nguyên liệu đã được cập nhật', life: 3000 });
  //   }
  // };
  const saveMaterial = async () => {
    if (editingMaterial && !isValidMaterial(editingMaterial)) return;
    if (!editingMaterial) return;
    try {
      // Gửi yêu cầu PUT tới backend để cập nhật nguyên liệu
      const response = await axios.put(`http://localhost:8000/api/ingredient/${editingMaterial.id}`, {
        name: editingMaterial.name,
        type: editingMaterial.type,
        buyDate: new Date(editingMaterial.buyDate).toISOString(),  // Chuyển đổi thành ISO 8601
        endDate: new Date(editingMaterial.endDate).toISOString(),  // Chuyển đổi thành ISO 8601
        number: editingMaterial.number,
        unit: editingMaterial.unit,
        cost: editingMaterial.cost,
        supplierName: editingMaterial.supplierName
      }); 
  
      // Nếu server trả về thành công, ta sẽ cập nhật lại danh sách nguyên liệu
      if ( response.status === 200) {
        setMaterials(
          materials.map((material) =>
            material.id === editingMaterial.id ? editingMaterial : material
          )
        );
        setEditingMaterial(null);
        setDialogVisible(false);
        toast.current?.show({ severity: 'success', summary: 'Cập nhật thành công', detail: 'Thông tin nguyên liệu đã được cập nhật', life: 3000 });
      } else {
        toast.current?.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể cập nhật nguyên liệu', life: 3000 });
      }
    } catch (error) {
      console.error('Error saving material:', error);
      toast.current?.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể cập nhật nguyên liệu', life: 3000 });
    }
  };

  // const deleteSelectedMaterials = () => {
  //   setMaterials(materials.filter(material => !selectedMaterials.includes(material)));
  //   setSelectedMaterials([]);
  //   toast.current?.show({ severity: 'success', summary: 'Xóa thành công', detail: 'Nguyên liệu đã được xóa', life: 3000 });
  // };
  const deleteSelectedMaterials = async () => {
    try {
      // Gửi yêu cầu xóa tới server
      await Promise.all(
        selectedMaterials.map(material => axios.delete(`http://localhost:8000/api/ingredient/${material.id}`))
      );
      setMaterials(materials.filter(material => !selectedMaterials.includes(material))); // Cập nhật lại danh sách
      setSelectedMaterials([]);
      toast.current?.show({ severity: 'success', summary: 'Xóa thành công', detail: 'Nguyên liệu đã được xóa', life: 3000 });
    } catch (error) {
      console.error('Error deleting materials:', error);
      toast.current?.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể xóa nguyên liệu', life: 3000 });
    }
  };

  const onSearchChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSearchTerm(e.target.value);
  };

  const filteredMaterials = materials.filter(material =>
    material.name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div className="card">
      <Toast ref={toast} />
      <h5 className='mb-4'>Danh sách Nguyên vật liệu</h5>

      {/* Tìm kiếm */}
      <div className="p-d-flex p-jc-between p-mb-4">
        <InputText
          placeholder="Tìm kiếm theo tên nguyên liệu"
          value={searchTerm}
          onChange={onSearchChange}
          className="p-inputtext-sm"
          style={{ width: '400px' }}
        />
        <Button
          label="Thêm mới"
          icon="pi pi-plus"
          className="p-button-sm p-button-success"
          style={{ marginLeft: '10rem' }}
          onClick={() => setDialogVisible(true)}
        />
        <Button
          label="Xóa đã chọn"
          icon="pi pi-trash"
          className="p-button-sm p-button-danger"
          style={{ marginLeft: '10rem' }}
          onClick={deleteSelectedMaterials}
          disabled={selectedMaterials.length === 0}
        />
      </div>

      <DataTable
        value={filteredMaterials}
        paginator
        rows={5}
        responsiveLayout="scroll"
        selection={selectedMaterials}
        onSelectionChange={(e) => setSelectedMaterials(e.value)}
        dataKey="id"
        selectionMode="multiple"  // Thêm dòng này
        style={{marginTop: '3rem', width: '100%'}}
      >
        <Column selectionMode="multiple" headerStyle={{ width: '3em' }} />
        <Column field="id" header="ID" />
        <Column field="name" header="Tên nguyên vật liệu" sortable  />
        <Column field="type" header="Loại" sortable  />
        <Column field="buyDate" header="Ngày mua" sortable  />
        <Column field="endDate" header="Ngày hết hạn" sortable  />
        <Column field="number" header="Số lượng" sortable  />
        <Column field="unit" header="Đơn vị" />
        <Column field="cost" header="Giá" sortable />
        <Column field="supplierName" header="Nhà cung cấp" sortable/>
        {/* Thêm nút sửa cho mỗi dòng */}
        <Column
          body={(rowData: Material) => (
            <Button
              icon="pi pi-pencil"
              className="p-button-text p-button-warning"
              onClick={() => editMaterial(rowData)}
            />
          )}
          header="Chỉnh sửa"
          bodyStyle={{ textAlign: 'center' }}
        />
      </DataTable>

      {/* Dialog để thêm mới hoặc chỉnh sửa nguyên liệu */}
      <Dialog
        visible={dialogVisible}
        // style={{ width: '450px' }}
        title={editingMaterial ? 'Chỉnh sửa nguyên vật liệu' : 'Thêm mới nguyên vật liệu'}
        // modal
        onHide={() => {
          setDialogVisible(false);
          setEditingMaterial(null);
        }}
        onSubmit={editingMaterial ? saveMaterial : addMaterial}
      >
        <div className="p-fluid">
          <div className="p-field">
            <label htmlFor="name">Tên nguyên vật liệu</label>
            <InputText
              id="name"
              value={editingMaterial ? editingMaterial.name : newMaterial.name}
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, name: e.target.value })
                  : setNewMaterial({ ...newMaterial, name: e.target.value })
              }
              autoFocus
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }}         
            />
          </div>
          <div className="p-field">
            <label htmlFor="type">Loại</label>
            <InputText
              id="type"
              value={editingMaterial ? editingMaterial.type : newMaterial.type}
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, type: e.target.value })
                  : setNewMaterial({ ...newMaterial, type: e.target.value })
              }
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
          <div className="p-field">
            <label htmlFor="buyDate">Ngày mua</label>
            <InputText
              id="buyDate"
              value={editingMaterial ? editingMaterial.buyDate : newMaterial.buyDate}
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, buyDate: e.target.value })
                  : setNewMaterial({ ...newMaterial, buyDate: e.target.value })
              }
              type="date"
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
          <div className="p-field">
            <label htmlFor="endDate">Ngày hết hạn</label>
            <InputText
              id="endDate"
              value={editingMaterial ? editingMaterial.endDate : newMaterial.endDate}
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, endDate: e.target.value })
                  : setNewMaterial({ ...newMaterial, endDate: e.target.value })
              }
              type="date"
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
          <div className="p-field">
            <label htmlFor="number">Số lượng</label>
            <InputText
              id="number"
              value={editingMaterial ? String(editingMaterial.number) : String(newMaterial.number)} 
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, number: parseFloat(e.target.value) })
                  : setNewMaterial({ ...newMaterial, number: parseFloat(e.target.value) })
              }
              type="number"
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
          <div className="p-field">
            <label htmlFor="unit">Đơn vị</label>
            <InputText
              id="unit"
              value={editingMaterial ? editingMaterial.unit : newMaterial.unit}
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, unit: e.target.value })
                  : setNewMaterial({ ...newMaterial, unit: e.target.value })
              }
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
          <div className="p-field">
            <label htmlFor="cost">Giá</label>
            <InputText
              id="cost"
              value={editingMaterial ? String(editingMaterial.cost) : String(newMaterial.cost)}
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, cost: parseFloat(e.target.value) })
                  : setNewMaterial({ ...newMaterial, cost: parseFloat(e.target.value) })
              }
              type="number"
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
          <div className="p-field">
            <label htmlFor="supplierName">Nhà cung cấp</label>
            <InputText
              id="supplierName"
              value={editingMaterial ? String(editingMaterial.supplierName) : String(newMaterial.supplierName)}
              onChange={(e) =>
                editingMaterial
                  ? setEditingMaterial({ ...editingMaterial, supplierName: e.target.value })
                  : setNewMaterial({ ...newMaterial, supplierName: e.target.value })
              }
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
          {!editingMaterial && (
          <div className="p-field">
            <label htmlFor="storeId">Cửa hàng</label>
            <InputText
              id="storeId"
              value={String(newMaterial.storeId)}
              onChange={(e) =>
                setNewMaterial({ ...newMaterial, storeId: parseInt(e.target.value) })
              }
              type="number"
              style={{
                backgroundColor: '#f0f0f0',  // Màu nền
                color: '#333',                // Màu chữ
              }} 
            />
          </div>
        )}
        </div>
      </Dialog>
    </div>
  );
};

export default Materials;




