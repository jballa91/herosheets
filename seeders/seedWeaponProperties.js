const fetch = require("node-fetch");
const chalk = require("chalk");
const {PrismaClient} = require("@prisma/client");

const prisma = new PrismaClient();

const seedWeaponProperties = async () => {
    console.log("");
    console.log(chalk.yellow("Starting..."))

    let data = await fetch("https://dnd5eapi.co/api/weapon-properties");
    let {results} = await data.json();

    console.log(chalk.green("Got Weapon Properties."));

    let indices = [];
    for (item of results) {
        indices.push(item.index)
    }

    console.log(chalk.yellow("Seeding..."));
    console.log("");
    for (item of indices) {
        let propdata = await fetch(`https://dnd5eapi.co/api/weapon-properties/${item}`);
        let founditem = await propdata.json();

        console.log(chalk.black.bgCyan("Weapon Proficiency:"), chalk.cyan(` ${founditem.name}`));

        await prisma.weaponProperty.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                description: founditem.desc,
                url: founditem.url,
            },
        });
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("--------------------------------"));
    console.log(chalk.green("FINISHED SEEDING WEAPON PROPERTY"));
    console.log(chalk.green("--------------------------------"));
} 

module.exports = seedWeaponProperties;