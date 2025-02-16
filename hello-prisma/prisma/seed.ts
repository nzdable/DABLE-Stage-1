const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const main = async () => {
  // Create members
  const member1 = await prisma.member.create({
    data: {
      name: "Alice Johnson",
      role: "Developer",
    },
  });

  const member2 = await prisma.member.create({
    data: {
      name: "Bob Smith",
      role: "Designer",
    },
  });

  // Create projects
  const project1 = await prisma.project.create({
    data: {
      name: "Health App",
      description: "A project for tracking health metrics.",
    },
  });

  const project2 = await prisma.project.create({
    data: {
      name: "E-commerce Platform",
      description: "An online shopping website.",
    },
  });

  // Assign members to projects
  await prisma.memberProjects.createMany({
    data: [
      { member_id: member1.id, project_id: project1.id },
      { member_id: member1.id, project_id: project2.id },
      { member_id: member2.id, project_id: project1.id },
    ],
  });

  console.log("Seeding completed!");
};

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
