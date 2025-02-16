/*
  Warnings:

  - You are about to drop the column `projects_id` on the `MemberProjects` table. All the data in the column will be lost.
  - You are about to drop the `Members` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Projects` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[member_id,project_id]` on the table `MemberProjects` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `project_id` to the `MemberProjects` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MemberProjects" DROP COLUMN "projects_id",
ADD COLUMN     "project_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Members";

-- DropTable
DROP TABLE "Projects";

-- CreateTable
CREATE TABLE "Member" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "Member_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "MemberProjects_member_id_project_id_key" ON "MemberProjects"("member_id", "project_id");
