const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedMagicItems = async () => {
    console.log("");
    console.log(chalk.yellow("Starting..."));

    let magicItemsData = await fetch("https://dnd5eapi.co/api/magic-items");
    let magicItems = await magicItemsData.json();

    console.log(chalk.green("Got Magic Items"));

    let indices = [];
    for (item of magicItems.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Magic Items..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/magic-items/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Magic Item:"), chalk.cyan(` ${founditem.name}`));

        // Source api uses 'wondrous-items' for category, but 'wondrous-item' for the item's category.
        let category = await prisma.equipmentCategory.findUnique({
            where: {
                index: founditem.equipment_category.index === "wondrous-item" 
                    ? "wondrous-items" 
                    : founditem.equipment_category.index,
            },
        });

        await prisma.magicItem.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                equipment_category_id: category.id,
                description: founditem.description,
                url: founditem.url,
            },
        });
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("----------------------------"));
    console.log(chalk.green("FINISHED SEEDING MAGIC ITEMS"));
    console.log(chalk.green("----------------------------"));
}

module.exports = seedMagicItems;