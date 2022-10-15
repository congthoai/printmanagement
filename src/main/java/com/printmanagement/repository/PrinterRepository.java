package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.PrinterEntity;



public interface PrinterRepository extends JpaRepository<PrinterEntity, Long> {

}
