const fetch = require("node-fetch");
const {log} = require("mercedlogger");
const {PrismaClient} = require("@prisma/client");

const prisma = new PrismaClient();

const seedWeaponProperties = async () => {
    let data = await fetch("https://dnd5eapi.co/api/weapon-properties");
    let {results} = await data.json();

    let indices = [];
    for (item of results) {
        indices.push(item.index)
    }

    for (item of indices) {
        let propdata = await fetch(`https://dnd5eapi.co/api/weapon-properties/${item}`);
        let prop = await propdata.json();

        log.cyan("Property", prop.name);

        await prisma.weaponProperty.create({
            data: {
                index: prop.index,
                name: prop.name,
                description: prop.desc,
                url: prop.url,
            },
        });
    }

    await prisma.$disconnect();
    log.green("        ", "----------------------------------")
    log.green("        ", "FINISHED SEEDING WEAPON PROPERTIES")
    log.green("        ", "----------------------------------")
} 

seedWeaponProperties();