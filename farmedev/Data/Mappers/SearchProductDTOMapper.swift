//
//  SearchProductDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SearchProductDTO {

    func toDomain() -> SearchProduct {
        SearchProduct(
            data: data?.toDomain(),
            responseCode: responseCode ?? "",
            message: message ?? ""
        )
    }
}

extension SearchProductDTO.PaginatedProductDTO {
    func toDomain() -> SearchProduct.PaginatedProduct {
        SearchProduct.PaginatedProduct(
            total: total ?? 0,
            page: page ?? 0,
            records: records ?? 0,
            totalRecords: totalRecords ?? 0,
            rows: rows?.map { $0.toDomain() } ?? [],
            categories: categories?.map { $0.toDomain() } ?? [],
            brands: brands ?? [],
            presentation: presentation ?? [],
            pharmaceuticalForm: pharmaceuticalForm ?? [],
            prescriptionType: prescriptionType?.map { $0.toDomain() } ?? []
        )
    }
}

extension SearchProductDTO.CategoryListDTO {
    func toDomain() -> SearchProduct.CategoryList {
        SearchProduct.CategoryList(
            id: id ?? "",
            name: name ?? "",
            check: check ?? "",
            checkTemp: checkTemp ?? ""
        )
    }
}

extension SearchProductDTO.PrescriptionTypeDTO {
    func toDomain() -> SearchProduct.PrescriptionType {
        SearchProduct.PrescriptionType(
            id: id ?? "",
            code: code ?? "",
            name: name ?? "",
            check: check ?? "",
            checkTemp: checkTemp ?? ""
        )
    }
}
