const fetch = require("node-fetch");
const {log} = require("mercedlogger");
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
        log.cyan("Category", founditem.name);
    }
    await prisma.$disconnect()
    log.green("        ", "-------------------------------------")
    log.green("        ", "FINISHED SEEDING EQUIPMENT CATEGORIES")
    log.green("        ", "-------------------------------------")
}

seedEquipmentCategories()