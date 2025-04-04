<p align="center">
  <img width="180" src="https://img2.pic.in.th/pic/mass.png")
" alt="cctv">
  <p align="center">ป้ายตรวจจับทะเบียนรถ ด้วย CCTV </p>
</p>

[![fake download](https://img.shields.io/github/downloads/lencx/ChatGPT/total.svg?style=flat-square)]

# Mass Corporation CCTV License Plate Detection System

## Overview

โครงการนี้เป็นการพัฒนา **ระบบตรวจจับป้ายทะเบียนรถ** โดยใช้กล้องวงจรปิด (CCTV) และ **โปรแกรมตรวจจับป้ายทะเบียนรถ** ที่เขียนด้วย **Python** ซึ่งนำข้อมูลการตรวจจับรถยนต์เข้าออกเข้าสู่ฐานข้อมูล **phpMyAdmin** และนำข้อมูลเหล่านี้แสดงผลผ่านเว็บไซต์ โดยสามารถแสดงรายละเอียดของรถที่เข้ามาหรือออกจากสถานที่ เช่น **ป้ายทะเบียนรถ** ผู้ครอบครองรถยนต์ และเวลาเข้าออก ซึ่งข้อมูลทั้งหมดถูกจัดการผ่าน **MySQL database** ที่เชื่อมโยงกับเว็บไซต์

## Components

### 1. License Plate Detection (Python)

- ส่วนนี้เป็น **โปรแกรม Python** ที่ใช้สำหรับการตรวจจับป้ายทะเบียนรถจาก **CCTV** โดยใช้โมเดลการตรวจจับวัตถุ เช่น **YOLO** เพื่อตรวจจับป้ายทะเบียนรถที่ปรากฏในกล้อง
- เมื่อโปรแกรมตรวจจับป้ายทะเบียนได้ จะส่งข้อมูลไปยัง **phpMyAdmin (MySQL)** เพื่อจัดเก็บป้ายทะเบียน, เวลาที่รถเข้าหรือออก, รวมถึงสถานะรถที่เข้า (in) หรือออก (out)
- การเชื่อมต่อฐานข้อมูลทำผ่าน **MySQL** ซึ่งทำงานร่วมกับ **phpMyAdmin**

### 2. Web Application

- เว็บไซต์นี้ถูกพัฒนาขึ้นเพื่อแสดงข้อมูลรถยนต์ที่ถูกตรวจจับโดยโปรแกรม Python ที่เชื่อมต่อกับกล้อง **CCTV**
- ผู้ใช้สามารถป้อนหมายเลขป้ายทะเบียนเพื่อตรวจสอบข้อมูลรถ เช่น **เวลาเข้าออก, สถานะ, สีรถ, ยี่ห้อ** รวมถึงลิงก์สำหรับดูวิดีโอที่เกี่ยวข้องกับรถคันนั้น
- ข้อมูลทั้งหมดที่แสดงในเว็บไซต์ถูกดึงมาจากฐานข้อมูล **MySQL** ที่จัดการโดย **phpMyAdmin**

### 3. Database (MySQL via phpMyAdmin)

- ฐานข้อมูลที่ใช้จัดเก็บข้อมูลต่างๆ ของระบบ เช่น **ป้ายทะเบียนรถ, ชื่อเจ้าของ, เวลาเข้าออก** และข้อมูลอื่นๆ ของรถ
- ฐานข้อมูลนี้ถูกออกแบบมาให้รองรับการดึงข้อมูลทั้งจาก **โปรแกรม Python** และ **เว็บไซต์**

## Key Features

- ตรวจจับป้ายทะเบียนรถจาก **CCTV** ผ่านโปรแกรม Python โดยใช้โมเดล YOLO สำหรับการตรวจจับวัตถุ
- บันทึกข้อมูลป้ายทะเบียนและเวลาเข้าออกลงในฐานข้อมูล **MySQL**
- เว็บไซต์สามารถค้นหาข้อมูลการเข้าออกของรถด้วยหมายเลขป้ายทะเบียน
- ระบบรองรับการดึงข้อมูลจากฐานข้อมูล **phpMyAdmin** และแสดงผลในรูปแบบตารางที่ใช้งานง่าย พร้อมลิงก์วิดีโอที่เกี่ยวข้อง
- การออกแบบเว็บไซต์ที่ดูทันสมัยและใช้งานง่าย

## Technologies Used

- **Python**: ใช้ในการพัฒนาโปรแกรมตรวจจับป้ายทะเบียนรถจากกล้อง **CCTV**
- **YOLO (You Only Look Once)**: ใช้สำหรับการตรวจจับวัตถุในภาพที่ได้จาก **CCTV**
- **MySQL**: ฐานข้อมูลที่ใช้ในการจัดเก็บข้อมูลรถเข้าออก
- **phpMyAdmin**: ใช้ในการจัดการฐานข้อมูล MySQL
- **HTML, CSS**: ใช้ในการออกแบบเว็บไซต์ที่แสดงผลข้อมูลรถ
- **JavaScript**: ใช้ในการจัดการฟังก์ชันการค้นหาและแสดงผลบนเว็บไซต์

## Demo (รูปภาพ)

โปรแกรมตัวอย่างในระบบตรวจจับป้ายทะเบียนและเว็บไซต์ (ตามภาพที่แนบมา) จะแสดงผลการค้นหาป้ายทะเบียนที่ถูกบันทึกในฐานข้อมูล พร้อมข้อมูลอื่นๆ ที่เกี่ยวข้อง

## หน้า login

![image](https://github.com/user-attachments/assets/093570fe-6b70-4327-898a-3eb6126253da)

## ค้นหาเลขทะเบียนรถ

![image](https://github.com/user-attachments/assets/b0ba4e80-3dfc-457e-992f-dcd784ecbc03)

## ผลลัพการค้นหา สามารถดูคลิปวีดีโอที่เก็บไว้ใน database

![image](https://github.com/user-attachments/assets/03f53f3e-a143-47b3-a603-e46420630cd0)

<!-- *check* -->
