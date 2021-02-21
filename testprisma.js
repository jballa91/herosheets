const {PrismaClient} = require("@prisma/client");

const prisma = new PrismaClient();

let findItem = async () => {
    let data = await prisma.equipment.findUnique({
        where: {
            id: 1,
        },
        include: {
            equipment_category: {
                select: {
                    id: true,
                    name: true,
                }
            }
        }
    })

    console.log(data);
    await prisma.$disconnect();
}

findItem();