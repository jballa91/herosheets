const fetch = require("node-fetch");
const chalk = require("chalk");
const {PrismaClient} = require("@prisma/client");

const prisma = new PrismaClient();

const seedWeaponProperties = async () => {
    console.log(chalk.yellow("Starting..."))

    let data = await fetch("https://dnd5eapi.co/api/weapon-properties");
    let {results} = await data.json();

    console.log(chalk.green("Got Weapon Proficiencies."));

    let indices = [];
    for (item of results) {
        indices.push(item.index)
    }

    console.log(chalk.yellow("Seeding..."));
    console.log("");
    for (item of indices) {
        let propdata = await fetch(`https://dnd5eapi.co/api/weapon-properties/${item}`);
        let founditem = await propdata.json();

        console.log(chalk.black.bgCyan("Weapon Property:"), chalk.cyan(` ${founditem.name}`));

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
    console.log(chalk.green("-------------------------------------"));
    console.log(chalk.green("FINISHED SEEDING WEAPON PROFICIENCIES"));
    console.log(chalk.green("-------------------------------------"));
} 

seedWeaponProperties();