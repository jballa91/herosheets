const fetch = require("node-fetch");
const {PrismaClient} = require("@prisma/client");

let prisma = new PrismaClient();

const seedEquipmentCategories = async () => {
    let equipData = await fetch("https://dnd5eapi.co/api/equipment-categories");
    let equipment = await equipData.json();

    let indices = [];

    for (item of equipment.results) {
        indices.push(item.index)
    }

    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/equipment-categories/${item}`)
        let founditem = await data.json();

        await prisma.equipmentCategory.create({
            data: {
                index: founditem.index,
                name: founditem.name,
            }
        })
        console.log(founditem.name);
    }
    await prisma.$disconnect()
    console.log("-------------------------------------")
    console.log("FINISHED SEEDING EQUIPMENT CATEGORIES")
    console.log("-------------------------------------")
}

seedEquipmentCategories()