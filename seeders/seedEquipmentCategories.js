const fetch = require("node-fetch");
const chalk = require("chalk");
const {PrismaClient} = require("@prisma/client");

let prisma = new PrismaClient();

const seedEquipmentCategories = async () => {
    console.log(chalk.yellow("Starting..."))

    let equipData = await fetch("https://dnd5eapi.co/api/equipment-categories");
    let equipment = await equipData.json();

    console.log(chalk.green("Got Equipment Categories."));

    let indices = [];

    for (item of equipment.results) {
        indices.push(item.index)
    }

    console.log(chalk.yellow("Seeding..."))
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/equipment-categories/${item}`)
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Category:"), chalk.cyan(` ${founditem.name}`));

        await prisma.equipmentCategory.create({
            data: {
                index: founditem.index,
                name: founditem.name,
            }
        })
    }
    
    await prisma.$disconnect()
    console.log(chalk.green("-------------------------------------"));
    console.log(chalk.green("FINISHED SEEDING EQUIPMENT CATEGORIES"));
    console.log(chalk.green("-------------------------------------"));
}

module.exports = seedEquipmentCategories;