//
//  ProductModel.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import Foundation

// MARK: - ProductsData
struct ProductsData: Codable {
    let products: [ProductList]?
    let total, skip, limit: Int?
}

// MARK: - ProductList
struct ProductList: Codable {
    let id: Int?
    let title, description: String?
    let category: String?
    let price, discountPercentage, rating: Double?
    let stock: Int?
    let tags: [String]?
    let brand, sku: String?
    let weight: Int?
    let dimensions: Dimensions?
    let warrantyInformation, shippingInformation: String?
    let availabilityStatus: String?
    let reviews: [Review]?
    let returnPolicy: String?
    let minimumOrderQuantity: Int?
    let meta: Meta?
    let images: [String]?
    let thumbnail: String?
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double?
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: String?
    let barcode: String?
    let qrCode: String?
}


// MARK: - Review
struct Review: Codable {
    let rating: Int?
    let comment: String?
    let date: String?
    let reviewerName, reviewerEmail: String?
}
