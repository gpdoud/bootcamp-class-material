# PrsDb-Specs: Specifications for PRS Database

The PRS database is designed to support the functions of the Purchase Request System (PRS) for the capstone
project.

## User

The `User` table provides two functions:

1. Provides authentication for users wishing to use the PRS
2. Provides ownership for `Request`s created (who created and 'owns' them)

| Name       | Type    | Null | Len | Unique | PK  | FK  | Def | Gen | Notes |
| ----       | ----    | ---- | --- | ------ | --- | --- | --- | --- | ----- |
| Id         | Integer | No   | N/A | Yes    | Yes | No  | No  | Yes | 1,1   |
| Username   | String  | No   | 30  | Yes    | No  | No  | No  | No  |       |
| Password   | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Firstname  | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Lastname   | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Phone      | String  | Yes  | 12  | No     | No  | No  | No  | No  |       |
| Email      | String  | Yes  | 255 | No     | No  | No  | No  | No  |       |
| IsReviewer | Boolean | No   | N/A | No     | No  | No  | 1   | No  |       |
| IsAdmin    | Boolean | No   | N/A | No     | No  | No  | 1   | No  |       |

Notes:

* The `Username` column must be unique for all rows though it is not the PK.
* The `Phone` columns should be in `xxx-xxx-xxxx` format if provided

## Vendor

The `Vendor` table provides one function:

1. Provides the name of the vendor from whom products are acquired

| Name       | Type    | Null | Len | Unique | PK  | FK  | Def | Gen | Notes |
| ----       | ----    | ---- | --- | ------ | --- | --- | --- | --- | ----- |
| Id         | Integer | No   | N/A | Yes    | Yes | No  | No  | Yes | 1,1   |
| Code       | String  | No   | 30  | Yes    | No  | No  | No  | No  |       |
| Name       | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Address    | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| City       | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| State      | String  | No   | 2   | No     | No  | No  | No  | No  |       |
| Zip        | String  | No   | 5   | No     | No  | No  | No  | No  |       |
| Phone      | String  | Yes  | 12  | No     | No  | No  | No  | No  |       |
| Email      | String  | Yes  | 255 | No     | No  | No  | No  | No  |       |

Notes:

1. The `Code` column must be unique for all rows though it is not the PK.

## Product

The `Product` table provides two functions:

1. Provides the list of products that can be added to a `RequestLine`
2. Provides the name and price of products

| Name       | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----       | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id         | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| PartNbr    | String  | No   | 30   | Yes    | No  | No  | No  | No  |       |
| Name       | String  | No   | 30   | No     | No  | No  | No  | No  |       |
| Price      | Decimal | No   | 11,2 | No     | No  | No  | No  | No  |       |
| Unit       | String  | No   | 30   | No     | No  | No  | No  | No  |       |
| PhotoPath  | String  | Yes  | 255  | No     | No  | No  | No  | No  |       |
| VendorId   | Integer | No   | N/A  | No     | No  | Yes | No  | No  | FK to Vendor |

Notes:

1. The `PartNbr` column must be unique for all rows though it is not the PK. It 
represents the vendors identifier for the product
2. The `Name` is the column displayed to the user and is the name of the product
given by the company.
3. The `VendorId` points to the vendor that supplies the product.

## Request

The `Request` table is the heart of the PRS. Together with a collection of `RequestLine`
rows makes up the user's request of products. It has xxx functions:

1. Provides the grouping for all the products being requested.
2. Provides the user that created the request
3. Provides the total amount of all the products being requested

| Name            | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----            | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id              | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| Description     | String  | No   | 80   | No     | No  | No  | No  | No  |       |
| Justification   | String  | No   | 80   | No     | No  | No  | No  | No  |       |
| RejectionReason | String  | Yes  | 80   | No     | No  | No  | No  | No  |       |
| DeliveryMode    | String  | No   | 20   | No     | No  | No  | Yes | No  | Def 'Pickup' |
| Status          | String  | No   | 10   | No     | No  | No  | Yes | No  | Def 'NEW'    |
| Total           | Decimal | No   | 11,2 | No     | No  | No  | Yes | No  | Def 0 |
| UserId          | Integer | No   | N/A  | No     | No  | Yes | No  | No  | FK to User |

Notes:

* `RejectionReason` must be provided when the request is rejected
* The `UserId` is automatically set to the Id of the logged in user.
* Neither `Status` nor `Total` may be set by the user. These are set by the application only.
* The `Total` is auto calculated by adding up all the lines currently on the request

## RequestLine

The `RequestLine` table implements a many-to-many relationship between the request and product tables. Each request
can have multiple requestLines and every product can have multiple lines. This means that every request can be related
to multiple products and each product can be related to multiple requests.

The `RequestLine` holds all the product for a particular request.

| Name            | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----            | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id              | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| RequestId       | Integer | No   | N/A  | No     | No  | Yes | No  | No  |       |
| ProductId       | Integer | No   | N/A  | No     | No  | Yes | No  | No  |       |
| Quantity        | Integer | No   | N/A  | No     | No  | No  | Yes | No  | def to 1 |

Notes:

* `Quantity` must be greater than or equal to zero (cannot be negative)
