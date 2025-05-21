const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const defaultKeys = [
    "Record",
    "InfrastructureInformation",
    "Vision",
    "Structure",
    "Contact",
  ];

  for (const key of defaultKeys) {
    await prisma.companies.upsert({
      where: { key }, // ✅ ตอนนี้ Prisma เข้าใจ key แล้ว
      update: {},
      create: {
        key,
        value: "",
      },
    });
  }

  console.log("✅ Seeded default companies data");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
