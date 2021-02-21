const fetch = require("node-fetch")
const { log } = require("mercedlogger");
const {PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedProficiencies = async () => {
    const profData = await fetch("https://dnd5eapi.co/api/proficiencies");
    const profs = await profData.json();

    let indices = [];

    for (item of profs.results) {
        indices.push(item.index);
    }

    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/proficiencies/${item}`);
        let founditem = await data.json();

        log.cyan("Proficiency", founditem.name);

        await prisma.proficiency.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                type: founditem.type,
                url: founditem.url,
            }
        })
    }

    await prisma.$disconnect();
    log.green("           ", "------------------------------");
    log.green("           ", "FINISHED SEEDING PROFICIENCIES");
    log.green("           ", "------------------------------");
}

seedProficiencies();