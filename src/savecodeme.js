// generator client {
//   provider = "prisma-client-js"
// }

// datasource db {
//   provider = "mysql"
//   url      = env("DATABASE_URL")
// }

// model user {
//   id                      Int                       @id @default(autoincrement())
//   gender                  String
//   firstName               String
//   lastName                String
//   email                   String
//   phone                   String
//   password                String
//   status                  String?
//   profile                 String?
//   postuserreport          postuserreport[]
//   commentinpostuserreport commentinpostuserreport[]
//   datashop                datashop[]
//   commentshop             commentshop[]
//   requestwatchcctv        requestwatchcctv[]
//   sosvoiceorvdo           sosvoiceorvdo[]
//   integratedinformation   integratedinformation[]
// }

// model otp {
//   id     Int    @id @default(autoincrement())
//   otp    String @db.VarChar(4)
//   userId Int
// }

// model postuserreport {
//   id                      Int                       @id @default(autoincrement())
//   texttitle               String                    @db.Text
//   image                   String?                   @db.Text
//   textstory               String?                   @db.Text
//   map                     String?                   @db.Text
//   vdo                     String?                   @db.Text
//   status                  String
//   createdAt               DateTime                  @default(now())
//   updatedAt               DateTime                  @updatedAt
//   userId                  Int
//   user                    user                      @relation(fields: [userId], references: [id])
//   commentinpostuserreport commentinpostuserreport[]
// }

// model commentinpostuserreport {
//   id             Int            @id @default(autoincrement())
//   text           String         @db.Text
//   image          String?        @db.Text
//   createdAt      DateTime       @default(now())
//   status         String
//   vdo            String?        @db.Text
//   userId         Int
//   user           user           @relation(fields: [userId], references: [id])
//   reportId       Int
//   postuserreport postuserreport @relation(fields: [reportId], references: [id])
//   isNotified     Boolean        @default(false)
// }

// model datashop {
//   id          Int           @id @default(autoincrement())
//   createdAt   DateTime      @default(now())
//   name        String
//   address     String        @db.Text
//   phone       String
//   image       String        @db.Text
//   category    String
//   details     String        @db.Text
//   status      String
//   latitude    String?
//   longtitude  String?
//   userId      Int?
//   user        user?         @relation(fields: [userId], references: [id])
//   commentshop commentshop[]
// }

// model commentshop {
//   id         Int      @id @default(autoincrement())
//   comment    String   @db.Text
//   image      String?  @db.Text
//   score      Int?
//   createdAt  DateTime @default(now())
//   userId     Int?
//   user       user?    @relation(fields: [userId], references: [id])
//   datashopId Int
//   datashop   datashop @relation(fields: [datashopId], references: [id])
// }

// model requestwatchcctv {
//   id          Int      @id @default(autoincrement())
//   firstName   String   @db.Text
//   lastName    String   @db.Text
//   tel         String   @db.Text
//   nationalId  String   @db.VarChar(13)
//   numDocument String   @db.Text
//   createdAt   DateTime @default(now())
//   updatedAt   DateTime @updatedAt
//   point       String   @db.Text
//   status      String   @db.Text
//   remark      String?  @db.Text
//   image       String   @db.Text
//   userId      Int?
//   user        user?    @relation(fields: [userId], references: [id])
// }

// model sosvoiceorvdo {
//   id         Int      @id @default(autoincrement())
//   file       String?  @db.Text
//   status     String
//   latitude   String?
//   longtitude String?
//   createdAt  DateTime @default(now())
//   updatedAt  DateTime @updatedAt
//   userId     Int?
//   user       user?    @relation(fields: [userId], references: [id])
// }

// model integratedinformation {
//   id            Int      @id @default(autoincrement())
//   male          String   @default("-")
//   female        String   @default("-")
//   household     String   @default("-")
//   store         String   @default("-")
//   restaurant    String   @default("-")
//   place         String   @default("-")
//   accommodation String   @default("-")
//   createdAt     DateTime @default(now())
//   userId        Int?
//   user          user?    @relation(fields: [userId], references: [id])
// }

// model companies {
//   key       String   @id
//   value     String?
//   createdAt DateTime @default(now())
//   updatedAt DateTime @updatedAt
// }
