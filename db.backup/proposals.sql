-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 19, 2018 at 12:03 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proposals`
--

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assets`
--

CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_assets`
--

INSERT INTO `craft_assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(35, 1, 1, 'Glyphix_Logo_Color-01.svg', 'image', 432, 174, 4397, NULL, '2018-06-18 18:11:40', '2018-06-18 18:11:40', '2018-06-18 18:11:40', '596ba3c8-b3bd-4847-80ac-f62ed364fc17'),
(36, 1, 1, 'IdeaBase_Logo_HorizontalColor.svg', 'image', 1000, 270, 6636, NULL, '2018-06-18 18:11:40', '2018-06-18 18:11:40', '2018-06-18 18:11:40', 'd0432a53-c119-4a06-95a1-0f188965b9ca');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_categories`
--

INSERT INTO `craft_categories` (`id`, `groupId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(24, 1, '2018-06-18 17:11:36', '2018-06-18 18:03:02', '4b36e3d1-2a08-4eda-91e1-d3958f66fd7e'),
(25, 1, '2018-06-18 17:11:42', '2018-06-18 17:11:42', '4234079f-a3f3-4b88-8f17-3f11a4ef6fd6'),
(26, 1, '2018-06-18 17:19:52', '2018-06-18 17:19:52', '1d0a8da4-bcf8-4b75-80bf-54a5dc97997f'),
(27, 1, '2018-06-18 17:19:59', '2018-06-18 17:19:59', '61dd27e7-08fb-46ba-90c6-6cfa1379c617');

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_categorygroups`
--

INSERT INTO `craft_categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 14, 'Clients', 'clients', '2018-06-18 17:11:11', '2018-06-18 17:57:47', '95619862-d446-4f3d-aac8-ce20db4d0fa3');

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_sites`
--

CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_categorygroups_sites`
--

INSERT INTO `craft_categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'clients/{slug}', 'clients/_category', '2018-06-18 17:11:11', '2018-06-18 17:57:47', '9805f4cf-8188-492f-a43b-40c2daae1d06');

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body` text,
  `field_email` text,
  `field_phoneNumber` text,
  `field_copyright` text,
  `field_organization` text,
  `field_redactor` text,
  `field_projectId` text,
  `field_date` text,
  `field_situation` text,
  `field_pricePerHour` varchar(255) DEFAULT NULL,
  `field_timeline` text,
  `field_discount` int(10) DEFAULT NULL,
  `field_additionalCosts` text,
  `field_clientRevisions` varchar(255) DEFAULT NULL,
  `field_printingCosts` varchar(255) DEFAULT NULL,
  `field_imageAlt` text,
  `field_imageTitle` text,
  `field_projectType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_body`, `field_email`, `field_phoneNumber`, `field_copyright`, `field_organization`, `field_redactor`, `field_projectId`, `field_date`, `field_situation`, `field_pricePerHour`, `field_timeline`, `field_discount`, `field_additionalCosts`, `field_clientRevisions`, `field_printingCosts`, `field_imageAlt`, `field_imageTitle`, `field_projectType`) VALUES
(1, 1, 1, NULL, '2018-05-02 20:31:26', '2018-06-18 19:38:32', 'd570f867-dd68-4f6b-92b7-f9c8ad96ec9b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Home', '2018-05-02 20:42:28', '2018-06-18 17:09:53', '116d8c53-f4f7-45d6-a016-8bae0396ed04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 12, 1, NULL, '2018-05-07 20:19:03', '2018-05-09 18:47:43', '1c95dca9-3b88-4dcd-b35b-92d8cb6d384a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 13, 1, NULL, '2018-05-07 20:19:06', '2018-05-09 19:28:26', 'fb58221a-0b49-43d3-ba3c-09da76b8e7c8', NULL, 'testemail@email.com', '911', '<p>Copyright nIck pappas</p>\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 24, 1, 'A Client', '2018-06-18 17:11:36', '2018-06-18 18:03:02', '43b4f483-d97b-4e72-9065-81a224c6fb19', NULL, NULL, NULL, NULL, 'Kent State University', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 25, 1, 'B Client', '2018-06-18 17:11:42', '2018-06-18 17:11:42', '7aa18e6a-d4df-4ee7-9785-ed838477a244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 26, 1, 'C Client', '2018-06-18 17:19:52', '2018-06-18 17:19:52', 'c5c62437-ef9c-4a48-8c3f-de21aafb4bd8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 27, 1, 'D Client', '2018-06-18 17:19:59', '2018-06-18 17:19:59', 'a220cd55-09b3-4de0-9a5f-6bad56813b21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 28, 1, 'Proposal 1', '2018-06-18 17:36:13', '2018-06-18 19:45:35', '66ee15d1-fe10-4b4a-8310-2ba36872a75f', NULL, NULL, NULL, NULL, NULL, NULL, '1234project', 'January 1, 2076', '<p>The Kent Historical Society and Museum brings educational programs to schools, businesses, and civic organizations, as well as collaborates with community groups on projects such as the preservation of our historic Pioneer Cemetery, the Main Street Kent revitalization program, and historic preservation projects in the community. The Society is dedicated to documenting Kent history through artifacts, records, and documents from the people of the Kent community. </p>\n<p>The Kent Historical Society and Museum is seeking a website redesign in order to accomplish the following objectives:</p>\n<ul><li>A professional and visually appealing design</li><li>Organized content with intuitive navigation</li><li>Brand consistency on the web with other branded materials</li><li>The ability for users to purchase books and photographs online</li><li>Calendar of events</li></ul>', '60', '[{\"col1\":\"Initial design\",\"col2\":\"End of February\"},{\"col1\":\"Website\",\"col2\":\"End of April\"}]', 10, '[{\"col1\":\"Domain name registration\",\"col2\":\"$15 / year\"},{\"col1\":\"Hosting\",\"col2\":\"$25 / month\"},{\"col1\":\"CMS fee\",\"col2\":\"$299\"}]', '[\"foo\"]', '[\"bar\"]', NULL, NULL, 'glyphix'),
(16, 29, 1, 'Proposal 2', '2018-06-18 17:36:20', '2018-06-18 19:19:57', '5e79db4d-a3a2-4cbe-a9dc-4e8e4b2cda5a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '[]', NULL, NULL, NULL),
(17, 30, 1, 'Proposal 3', '2018-06-18 17:36:26', '2018-06-18 19:19:57', 'e68f8884-e3f4-4c31-9353-0b00d7077691', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '[]', NULL, NULL, NULL),
(18, 35, 1, 'Glyphix Logo Color 01', '2018-06-18 18:11:40', '2018-06-18 18:11:40', 'a8e589f3-4ff2-48eb-ae6a-73f32c3e97a5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 36, 1, 'Ideabase Logo Horizontalcolor', '2018-06-18 18:11:40', '2018-06-18 18:11:40', '1a735833-1f85-4498-8ca8-68467b143da9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 37, 1, NULL, '2018-06-18 18:13:02', '2018-06-18 18:53:31', 'e9997791-e56c-4fea-bf04-5e832be05074', NULL, NULL, NULL, NULL, NULL, '<p>For more information, or to discuss the proposal in detail, please contact Kristin Dowling at 330.672.7366 or kdowling@ideabasekent.com To agree and initiate start of work, please sign and fax to 330.672.7373.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 38, 1, NULL, '2018-06-18 18:13:20', '2018-06-18 18:53:42', '60470a72-b1ad-407c-a487-1003365779ae', NULL, NULL, NULL, NULL, NULL, '<h2>Working with IdeaBase</h2>\n<p>IdeaBase is a Kent State student-powered design agency in downtown Kent, Ohio. Our team represents a variety of backgrounds and disciplines, united in our passion for creating meaningful solutions for our clients, including:</p>\n<p><strong>Dedicated Account Management</strong>: When you sign with us, you also get a dedicated account manager who takes care of weekly communications and meetings, keeping your project on track and on budget. </p>\n<p><strong>A Design-Focused Team</strong>: You’ll benefit from a team of hand-selected Kent State students led by full-time staff, including a creative director, professional user experience designer, videographer / photographer, copywriters, developers and visual designers. </p>\n<p><strong>A Process Centered Around You</strong>: Our tried and true design process is custom-tailored to meet your needs and keep you updated along the way, producing a high-quality design product that also meets the needs of your customers.</p>\n<p><strong>University-Powered Expertise</strong>: We have the backing of Kent State, giving you access to the talent and resources of one of Ohio’s largest universities while also providing life-altering professional experiences to our students.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 39, 1, NULL, '2018-06-18 18:13:39', '2018-06-18 18:53:23', '1f4dbbdc-cb91-4af5-9a5c-2e3bb8f7ab60', NULL, NULL, NULL, NULL, NULL, '<p>IdeaBase, a Research-Based Design Agency and is an initiative of Kent State University, a state institution of higher education in Kent, Ohio. Ideabase is staffed primarily by Kent State University students as an educational opportunity coordinated through the Kent State University College of Communication and Information. By signing below, you are agreeing to and are legally bound by this Proposal of Engagement, as well as by the attached Terms and Conditions.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 40, 1, NULL, '2018-06-18 18:13:58', '2018-06-18 18:53:37', 'c4969845-51cc-4f7d-ba1b-3ab3b77fe4f6', NULL, NULL, NULL, NULL, NULL, '<h2>Terms and Conditions</h2>\n<p>By accepting the Proposal of Engagement, IdeaBase Integrated Marketing Communications at Kent State University (“IdeaBase”) and the Client agree to the following:</p>\n<p>Costs. These projected costs are preliminary and non-binding, and all work will be billed on a time and materials basis, in accordance with our engagement letter and/or our current rate schedule. In creating this Proposal, we are relying on the current representations of Client as to the extent of the scope of our engagement. Should the scope change, we will submit a new Proposal of Engagement that reflects the changes to the scope and any subsequent changes to the hours and costs. As work progresses, at your request, we will provide you with written updates on where the project stands against the scope and notify you in a timely manner if the hours will exceed the projected amount. We will continue to work in good faith with your assurance of payment (which you can signify by signing and returning this Proposal, or such subsequent Proposal that may be submitted as work progresses); if we do not receive payment or assurance of payment, we reserve the right to cease working on this engagement. When applicable, IdeaBase will adjust any fees due by the Client where IdeaBase believes in its sole discretion that such fees are due to unforeseen delay or other circumstances not based upon actions or omissions by the Client.</p>\n<p>Intellectual Property. It is understood that any plans or ideas fully developed and/or produced by The IdeaBase for you during the project, including but not limited to layouts and storyboards, become the exclusive intellectual property of Client, regardless of its incorporation into produced materials; provided. However, any and all information presented to Client in advance of receipt of compensation remains the property of IdeaBase and any use, alteration and/or modification of the property presented to Client during this time is at its discretion, either directly or indirectly, except as specifically provided otherwise. Each party retains the rights and ownership of all Intellectual Property respectively owned by the parties prior to this engagement. Both parties also agreed that the methodology designed and utilized during the provision of services by IdeaBase is the exclusive property of IdeaBase and any intellectual property rights regarding the methodology and practices employed by IdeaBase under this Agreement remain with the IdeaBase to the extent recognized by law. Client also grants to IdeaBase permission to use the work in self-promotion for the agency as well as individual portfolio promotion for the employees, unless provided otherwise. </p>\n<p>IdeaBase warranties. IdeaBase has the full rights to enter into this Agreement and to perform its obligations hereunder and will comply with all applicable Federal, State and Local Laws, ordinances and regulations. IdeaBase represent and warrant to Client that, as of the Effective Date, (a) We have the full right, power and authority to enter into, and fully perform Our obligations according to, the Agreement and (b)We have not knowingly infringed upon the intellectual property rights of any third party or knowingly misappropriated the trade secrets of any third party in granting the Software license to You.</p>\n<p>Client warranties. Client shall pay IdeaBase within 30 days of deliverables noted in the Statement of Work. Client hereby represents and warrants to IdeaBase that, as of the Effective Date, Client has the full right, power and authority to enter into, and fully perform Client’s obligations according to this Agreement.</p>\n<p>THE SERVICE OFFERINGS AND PRODUCTS ARE PROVIDED “AS IS.” IDEABASE MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, WHETHER EXPRESS, IMPLIED, STATUTORY OR OTHERWISE REGARDING THE SERVICE OR PRODUCTS PROVIDED. EXCEPT TO THE EXTENT PROHIBITED BY LAW, IDEABASE DISCLAIMS ALL WARRANTIES, INCLUDING ANY IMPLIED WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT, OR QUIET ENJOYMENT, AND ANY WARRANTIES ARISING OUT OF ANY COURSE OF DEALING OR USAGE OF TRADE. BOTH PARTIES FURTHER UNDERSTAND THAT THESE SERVICES ARE BEING PROVIDED IN ACCORDANCE WITH THE UNIVERSITY’S EDUCATIONAL MISSION TO ITS STUDENTS AND STAFF, AND IS NOT A PROFESSIONAL SERVICE PROVIDER. </p>\n<p>Payment. In consideration of the service provided, Client shall pay to the IdeaBase such fees as are provided for in the Statement of Work. Client understands that the specific terms of payment under this Agreement and the Statement of Work are based upon timely payment within 30 days of the deliverable. If Client chooses to defer paying any amount beyond the date on which it is due, Client may be charged at the IdeaBase’s discretion, as additional consideration, a late charge of 1% or the maximum permitted by law, whichever is higher. </p>\n<p>Termination. Either party may terminate this Agreement for cause upon written notice if the other party fails to cure any material breach of this Agreement within thirty (30) days after receiving written notice of such breach; or the other party ceases its business operations or becomes subject to insolvency proceedings and the proceedings are not dismissed within ninety days, provided however that the period to cure a breach with respect to payment shall be ten (10) days. Nonpayment of any deliverable shall be considered a material breach.</p>\n<p>Liability. To the extent permitted by Ohio law, each party agrees to be liable for the acts and omissions of its own officers, employees and agents engaged in the scope of their employment arising under this Agreement, and each party hereby agrees to be responsible for any and all liability, claims, costs, expenses or damages arising from any claim with respect to that party’s role in connection with this Agreement. The parties agree that nothing in this provision shall be construed as a waiver of the sovereign immunity of University and/or the State of Ohio beyond the waiver provided in Ohio Revised Code Section 2743.02. In no event shall either party be liable to the other party for indirect, consequential, incidental, special, or punitive damages, or lost profits.</p>\n<p>Taxes. Any sales tax, use tax, or other tax payable on production and delivery of Media to Client shall be the responsibility of Client, unless a valid tax-exemption certificate is presented prior to invoicing. </p>\n<p>Assignment and obligation. This Agreement nor any Statement of Work may be assigned by either party without the written consent of the other party. Except as expressly provided herein, neither party shall have the right to bind or obligate the other party in any manner without the other party’s prior written consent.</p>\n<p>Agency. Nothing herein shall be construed to create an agency relationship between the IdeaBase and Client, or any employment relationship between IdeaBase and any staff member provided by Client to perform the services under this Agreement. Neither party will represent to be or hold itself out as an agent or affiliate of the other at any time during the term of this Agreement. </p>\n<p>Use of Logos, Trademarks, etc. Neither party may use the other party’s identifying marks without the express written permission of the other party. Use of a party’s identifying marks without such permission will be considered a material breach of this Agreement. </p>\n<p>Equal Opportunity. Both parties subscribe to a policy of equal opportunity and will not discriminate on the basis of race, gender, religion, national origin, marital status, sexual orientation or physical disability. </p>\n<p>General Terms. Any notice required or permitted by this Agreement shall be sent by certified or registered mail, return receipt requested, and shall be deemed given upon receipt thereof.</p>\n<p>All notices to CLIENT shall be addressed to:</p>\n<pre>______________________________\n______________________________\n______________________________\nAttn: ________________________\nPhone: _______________________\nEmail: _______________________</pre>\n<p>All notices to IdeaBase shall be addressed to:</p>\n<pre>IdeaBase at Kent State University\n138 E. Main St.\nSuite 203\nKent, OH 44240\n330-672-7366</pre>\n<p>The headings in this Agreement have been inserted for convenient reference only and shall not be considered in any questions of interpretation or construction of this Agreement. If any section or provision of this Agreement is held illegal, unenforceable or in conflict with any law by a court of competent jurisdiction, such Section or provision of this Agreement shall be deemed severed from this Agreement and the validity of the remainder of this Agreement shall not be affected thereby. Failure of either party to insist upon the performance of any provision hereof or to exercise any right or remedy shall not be deemed a waiver of any right or remedy or of any existing or subsequent breach or default. This Agreement and the rights of the parties hereunder shall be governed, construed, and interpreted in accordance with the laws of the State of Ohio and only the Ohio Court of Claims shall have jurisdiction over any action or proceeding concerning the Agreement and/or performance thereunder.</p>\n<p>Entire Agreement. This Agreement contains the entire agreement between the parties hereto and shall not be modified, amended or supplemented, or any rights herein waived, unless such amendment or modification to this Agreement is (i) in writing; (ii) refers to this Agreement; and (iii) executed by an authorized representative of each party. This Agreement supersedes any and all previous agreements, whether written or oral, between the parties. In the event of a conflict between any subsequent Statement of Work and this Agreement, the terms of this Agreement shall prevail.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 41, 1, NULL, '2018-06-18 18:53:16', '2018-06-18 19:17:12', 'e8e66a00-e5a4-4b9c-a2ed-c75a081dfd2e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IdeaBase Logo', NULL, NULL),
(25, 42, 1, NULL, '2018-06-18 18:54:17', '2018-06-18 19:17:19', 'd1845e82-0573-4898-a665-d30fa6af5383', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Glyphix Logo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craft_craftidtokens`
--

CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elementindexsettings`
--

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'craft\\elements\\User', 1, 0, '2018-05-02 20:31:26', '2018-06-18 19:38:32', '89f45b03-5cb5-4ffb-b8ff-9762a1d787ea'),
(2, 1, 'craft\\elements\\Entry', 1, 0, '2018-05-02 20:42:28', '2018-06-18 17:09:53', '2f926fa0-3b77-4b8d-8a23-03a5069d3ef3'),
(11, 10, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 20:18:08', '2018-05-09 19:51:57', '5ab98c0c-f2d3-4375-adba-15ba62508093'),
(12, 11, 'craft\\elements\\GlobalSet', 1, 0, '2018-05-07 20:19:03', '2018-05-09 18:47:43', 'c2246d3f-7d05-4a74-9996-ddd0cfef84b7'),
(13, 12, 'craft\\elements\\GlobalSet', 1, 0, '2018-05-07 20:19:06', '2018-05-09 19:28:26', '68fe8888-5195-4685-9e90-131f2a5ba43e'),
(22, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 17:09:53', '2018-06-18 17:09:53', '3baf4e93-3de8-4ada-b18c-b67a7debdf22'),
(23, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 17:09:53', '2018-06-18 17:09:53', '162f358e-c493-4a27-9b82-104d65552e4b'),
(24, 14, 'craft\\elements\\Category', 1, 0, '2018-06-18 17:11:36', '2018-06-18 18:03:02', '0ad69fa8-a839-42ce-b4d8-0f5413570848'),
(25, 14, 'craft\\elements\\Category', 1, 0, '2018-06-18 17:11:42', '2018-06-18 17:11:42', 'deeba587-cd2d-4355-baa3-ca10c35bc323'),
(26, 14, 'craft\\elements\\Category', 1, 0, '2018-06-18 17:19:52', '2018-06-18 17:19:52', 'fdeabd2f-cce2-4335-ae09-9c47ebc18348'),
(27, 14, 'craft\\elements\\Category', 1, 0, '2018-06-18 17:19:59', '2018-06-18 17:19:59', '8cb0444e-8bf1-431b-9cbf-a62be6f81bf2'),
(28, 13, 'craft\\elements\\Entry', 1, 0, '2018-06-18 17:36:13', '2018-06-18 19:45:35', '6f50b518-7a79-4b14-937b-fad947935bf6'),
(29, 13, 'craft\\elements\\Entry', 1, 0, '2018-06-18 17:36:20', '2018-06-18 19:19:57', 'a5b3d7e6-3fe0-4ef2-b7d9-430dc12f00cb'),
(30, 13, 'craft\\elements\\Entry', 1, 0, '2018-06-18 17:36:26', '2018-06-18 19:19:57', 'c18309d8-12cc-42cf-9a51-597d623d396b'),
(31, 15, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 17:59:38', '2018-06-18 18:03:02', '9e98e68a-1d9d-4550-900d-8cf835302dd1'),
(32, 15, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 18:01:44', '2018-06-18 18:03:02', '6f1cf78c-04e9-4c1d-9ab2-e03cab2b9b0e'),
(33, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 18:01:44', '2018-06-18 18:03:02', '04aee096-8473-4ce5-9ee0-b7bd4d71960b'),
(34, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 18:03:02', '2018-06-18 18:03:02', '021e24a3-06d6-4cda-ae21-fbd0890e0911'),
(35, 9, 'craft\\elements\\Asset', 1, 0, '2018-06-18 18:11:40', '2018-06-18 18:11:40', '4e458ac5-09c9-4b45-b6f5-a2ddef09616c'),
(36, 9, 'craft\\elements\\Asset', 1, 0, '2018-06-18 18:11:40', '2018-06-18 18:11:40', 'e5c0ec5f-449e-4f6f-bb6a-a6ba1357e264'),
(37, 17, 'craft\\elements\\GlobalSet', 1, 0, '2018-06-18 18:13:02', '2018-06-18 18:53:31', 'caaa051c-0795-4b12-ab7b-4ee5f6f94e98'),
(38, 18, 'craft\\elements\\GlobalSet', 1, 0, '2018-06-18 18:13:20', '2018-06-18 18:53:42', '13034638-3459-4343-8448-ab744c909109'),
(39, 19, 'craft\\elements\\GlobalSet', 1, 0, '2018-06-18 18:13:39', '2018-06-18 18:53:23', 'f8ee07e2-c792-4653-8b55-89f0a395874e'),
(40, 20, 'craft\\elements\\GlobalSet', 1, 0, '2018-06-18 18:13:58', '2018-06-18 18:53:37', 'b750858a-80ab-4a06-aca8-35f3cda021c0'),
(41, 21, 'craft\\elements\\GlobalSet', 1, 0, '2018-06-18 18:53:16', '2018-06-18 19:17:12', 'bc7a891a-4329-4245-bee0-cb5cfa30017e'),
(42, 22, 'craft\\elements\\GlobalSet', 1, 0, '2018-06-18 18:54:17', '2018-06-18 19:17:19', 'c5586c8c-153c-4f57-9f35-28021013519c'),
(43, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 19:45:35', '2018-06-18 19:45:35', '9f786994-5b64-4b47-a0a5-787147d8308f'),
(44, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2018-06-18 19:45:36', '2018-06-18 19:45:36', '26f230b0-740e-4c41-9b4a-d8d63af51c6f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_sites`
--

CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_elements_sites`
--

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2018-05-02 20:31:26', '2018-06-18 19:38:32', '93590951-48e8-403b-8852-90af058d53cb'),
(2, 2, 1, 'home-page', '__home__', 1, '2018-05-02 20:42:28', '2018-06-18 17:09:53', '9e5fe65f-cc68-4244-8a18-4a4d503c6aa1'),
(11, 11, 1, NULL, NULL, 1, '2018-05-07 20:18:08', '2018-05-09 19:51:57', 'fb4af5b3-10d9-4761-ab94-1a69e1b8861a'),
(12, 12, 1, NULL, NULL, 1, '2018-05-07 20:19:03', '2018-05-09 18:47:43', 'b64d491c-83e3-4636-b8ae-b40b8678587c'),
(13, 13, 1, NULL, NULL, 1, '2018-05-07 20:19:06', '2018-05-09 19:28:26', 'bdefe40e-5c38-45df-ab54-1e3bc00cb202'),
(22, 22, 1, NULL, NULL, 1, '2018-06-18 17:09:53', '2018-06-18 17:09:53', 'b3436068-03dd-420e-9eca-aa89e686990e'),
(23, 23, 1, NULL, NULL, 1, '2018-06-18 17:09:53', '2018-06-18 17:09:53', 'd244733f-3dbf-4b8f-8c52-78f43434c3a7'),
(24, 24, 1, 'a-client', 'clients/a-client', 1, '2018-06-18 17:11:36', '2018-06-18 18:03:02', '430aec10-bc10-4454-9fdc-d6302e112fe1'),
(25, 25, 1, 'b-client', 'clients/b-client', 1, '2018-06-18 17:11:42', '2018-06-18 17:11:43', '1be41b0f-2a4c-44fc-9790-910711e877df'),
(26, 26, 1, 'c-client', 'clients/c-client', 1, '2018-06-18 17:19:52', '2018-06-18 17:19:54', 'bfcd6026-e77e-4704-a839-7d03c952d600'),
(27, 27, 1, 'd-client', 'clients/d-client', 1, '2018-06-18 17:19:59', '2018-06-18 17:20:01', '1cfd3331-6772-4af8-aeed-26c8a212a107'),
(28, 28, 1, 'proposal-1', 'proposals/proposal-1', 1, '2018-06-18 17:36:13', '2018-06-18 19:45:35', 'e40f555a-14f5-49e4-8bc7-b12c09a1a454'),
(29, 29, 1, 'proposal-2', 'proposals/proposal-2', 1, '2018-06-18 17:36:20', '2018-06-18 19:19:57', 'b127d32c-d62e-4026-8499-590510a3d372'),
(30, 30, 1, 'proposal-3', 'proposals/proposal-3', 1, '2018-06-18 17:36:26', '2018-06-18 19:19:57', '86ea8fed-a535-4485-8357-e1fb49a0e31c'),
(31, 31, 1, NULL, NULL, 1, '2018-06-18 17:59:38', '2018-06-18 18:03:02', 'e4a4a72a-4425-4268-be88-d404e56cf3de'),
(32, 32, 1, NULL, NULL, 1, '2018-06-18 18:01:44', '2018-06-18 18:03:02', '5c01bec7-e87b-4c5c-831a-4db8f51a5027'),
(33, 33, 1, NULL, NULL, 1, '2018-06-18 18:01:44', '2018-06-18 18:03:02', 'c2ba15c8-d4a1-4d11-9a25-97b3808b8d3d'),
(34, 34, 1, NULL, NULL, 1, '2018-06-18 18:03:02', '2018-06-18 18:03:02', '4672267a-6ca3-474c-9334-7741ef9c691c'),
(35, 35, 1, NULL, NULL, 1, '2018-06-18 18:11:40', '2018-06-18 18:11:40', '41e1cb49-8c43-41a3-a265-3af70b605429'),
(36, 36, 1, NULL, NULL, 1, '2018-06-18 18:11:40', '2018-06-18 18:11:40', 'e8659c1b-3195-4ed4-8613-ebfd153e55e6'),
(37, 37, 1, NULL, NULL, 1, '2018-06-18 18:13:02', '2018-06-18 18:53:31', '1286aba6-5f7c-455b-aa10-a46f5eeeed6f'),
(38, 38, 1, NULL, NULL, 1, '2018-06-18 18:13:20', '2018-06-18 18:53:42', 'd792a83b-07bf-4d48-8637-86bd2974cba9'),
(39, 39, 1, NULL, NULL, 1, '2018-06-18 18:13:39', '2018-06-18 18:53:23', 'c045801a-9542-4f48-9ac1-49037c6c9f75'),
(40, 40, 1, NULL, NULL, 1, '2018-06-18 18:13:58', '2018-06-18 18:53:37', '19840af4-31cf-4ee3-96a7-c3d9f6db02dd'),
(41, 41, 1, NULL, NULL, 1, '2018-06-18 18:53:16', '2018-06-18 19:17:12', '5c5bf976-9054-4314-aa3c-b87c317d84de'),
(42, 42, 1, NULL, NULL, 1, '2018-06-18 18:54:17', '2018-06-18 19:17:19', '10040261-06b8-45b1-ac17-f2fd39ba337d'),
(43, 43, 1, NULL, NULL, 1, '2018-06-18 19:45:35', '2018-06-18 19:45:35', '5a28a2e7-aeac-41b6-8937-54ebf9dae21c'),
(44, 44, 1, NULL, NULL, 1, '2018-06-18 19:45:36', '2018-06-18 19:45:36', 'b0aaf01d-8e07-4937-ab95-a67d6ecfa934');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 1, NULL, '2018-05-02 20:42:28', NULL, '2018-05-02 20:42:28', '2018-06-18 17:09:53', 'ae7775af-d769-4fcb-b46e-df2a77ac1c7e'),
(28, 2, 2, 1, '2018-06-18 17:36:00', NULL, '2018-06-18 17:36:14', '2018-06-18 19:45:35', '7dc8015c-acbe-486f-8555-0aff2b64abaa'),
(29, 2, 2, 1, '2018-06-18 17:36:00', NULL, '2018-06-18 17:36:20', '2018-06-18 19:19:57', 'a9e06a18-6e35-453c-8613-cd74f66c9d50'),
(30, 2, 2, 1, '2018-06-18 17:36:00', NULL, '2018-06-18 17:36:26', '2018-06-18 19:19:57', '0a0199fa-083d-4f2c-b56c-70891cd0e443');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrydrafts`
--

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'Home', 'homepage', 0, NULL, '{section.name|raw}', 1, '2018-05-02 20:42:28', '2018-06-18 16:57:24', '575e829a-d112-4988-889b-da0863cc2603'),
(2, 2, 13, 'Proposals', 'proposals', 1, 'Title', NULL, 1, '2018-06-18 17:10:28', '2018-06-18 19:19:56', '763f1f19-fc26-49e0-a62b-2676519c0924');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entryversions`
--

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entryversions`
--

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 1, 1, 1, 1, 'Revision from May 7, 2018, 12:37:46 PM', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"2\":[]}}', '2018-05-07 19:39:41', '2018-05-07 19:39:41', 'bfe69956-37d5-4648-b37e-4081cd5addb8'),
(2, 2, 1, 1, 1, 2, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}}}}}', '2018-05-07 19:39:42', '2018-05-07 19:39:42', 'cc426583-0a34-4ba1-b843-3bcb8ba9c015'),
(3, 2, 1, 1, 1, 3, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"]}}}}}', '2018-05-07 19:46:15', '2018-05-07 19:46:15', 'c23fe140-bc7d-4582-aec2-6c8182f036f5'),
(4, 2, 1, 1, 1, 4, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"],\"caption\":\"Browns suck\"}}}}}', '2018-05-07 19:49:01', '2018-05-07 19:49:01', '2fa8c224-e28b-435b-a592-76cd827fcb37'),
(5, 2, 1, 1, 1, 5, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"],\"caption\":\"Browns suck\"}}}}}', '2018-05-07 19:49:07', '2018-05-07 19:49:07', '0ec815f2-82e2-4084-93c9-a7a80d3ccb5e'),
(6, 2, 1, 1, 1, 6, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"],\"caption\":\"Browns suck\"}}}}}', '2018-05-07 19:52:36', '2018-05-07 19:52:36', '61dbc193-96fc-4085-8e25-cc8b04efba69'),
(7, 2, 1, 1, 1, 7, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"],\"caption\":\"Browns suck\"}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"],\"caption\":\"asdsadsda\"}}}}}', '2018-05-07 19:56:00', '2018-05-07 19:56:00', '8784d4f7-256a-4a5b-81a7-2a8e5e730735'),
(8, 2, 1, 1, 1, 8, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"]}}}}}', '2018-05-07 20:01:31', '2018-05-07 20:01:31', 'fe2f5fc3-f94b-4018-9df2-3f389936215e'),
(9, 2, 1, 1, 1, 9, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}}}}', '2018-05-07 20:02:37', '2018-05-07 20:02:37', '0ebb1662-f937-433d-ae40-939cd3d26fa3'),
(10, 2, 1, 1, 1, 10, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}}}}', '2018-05-07 20:13:54', '2018-05-07 20:13:54', '6efc642c-4b1d-48f4-8b1d-f419749a005b'),
(11, 2, 1, 1, 1, 11, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-07 20:18:08', '2018-05-07 20:18:08', '595a18b9-f607-4afe-ad8f-778ef8b1fc5b'),
(12, 2, 1, 1, 1, 12, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"14\"]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-07 20:22:07', '2018-05-07 20:22:07', '4757c0d9-c4e9-4332-bc2a-8b3d8316065a'),
(13, 2, 1, 1, 1, 13, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"14\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"16\"]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-07 20:41:15', '2018-05-07 20:41:15', 'b3d0558f-607f-4a68-bcc2-73bd128cd178'),
(14, 2, 1, 1, 1, 14, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"18\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"16\"]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-09 19:22:40', '2018-05-09 19:22:40', 'eda6ee73-89cc-4707-b542-2a41e75caff3'),
(15, 2, 1, 1, 1, 15, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"19\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-09 19:23:49', '2018-05-09 19:23:49', '7d36306c-24d5-4c04-a949-f66e109b0ed6'),
(16, 2, 1, 1, 1, 16, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"19\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-09 19:51:57', '2018-05-09 19:51:57', 'caac8596-6869-4bb5-837e-cfeafb0b64c6'),
(17, 2, 1, 1, 1, 17, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"20\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Clients\",\"buttonUrl\":\"/clients\"}},\"21\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Proposals\",\"buttonUrl\":\"/proposals\"}}}}}', '2018-06-18 16:48:53', '2018-06-18 16:48:53', 'a847c247-a446-49c7-a6b5-fe5f2f2e3ab7'),
(18, 2, 1, 1, 1, 18, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"20\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Clients\",\"buttonUrl\":\"/clients\"}},\"21\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Proposals\",\"buttonUrl\":\"/proposals\"}}}}}', '2018-06-18 16:57:40', '2018-06-18 16:57:40', '01ddbe4e-24ea-4121-9526-16b1284098f3'),
(19, 2, 1, 1, 1, 19, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"22\":{\"type\":\"buttonInternal\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonInternalText\":\"Clients\",\"buttonInternalUrl\":\"/clients\"}},\"23\":{\"type\":\"buttonInternal\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonInternalText\":\"Proposals\",\"buttonInternalUrl\":\"/proposals\"}}}}}', '2018-06-18 17:09:53', '2018-06-18 17:09:53', '863ce1cd-89b7-4cdb-8dc8-4f95130db5f6'),
(20, 28, 2, 1, 1, 1, '', '{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Proposal 1\",\"slug\":\"proposal-1\",\"postDate\":1529343360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":[]}', '2018-06-18 17:36:14', '2018-06-18 17:36:14', '89f2580d-14bd-4c53-bad9-9748efd24f6e'),
(21, 29, 2, 1, 1, 1, '', '{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Proposal 2\",\"slug\":\"proposal-2\",\"postDate\":1529343360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":[]}', '2018-06-18 17:36:20', '2018-06-18 17:36:20', '512b042b-dac3-40b8-b146-02622c407874'),
(22, 30, 2, 1, 1, 1, '', '{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Proposal 3\",\"slug\":\"proposal-3\",\"postDate\":1529343360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":[]}', '2018-06-18 17:36:26', '2018-06-18 17:36:26', 'bf4651ea-84c2-460b-a2b4-da1d25a47715'),
(23, 28, 2, 1, 1, 2, '', '{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Proposal 1\",\"slug\":\"proposal-1\",\"postDate\":1529343360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"43\":[\"24\"]}}', '2018-06-18 18:06:57', '2018-06-18 18:06:57', 'be552ba9-88f0-405f-bf94-c535ed5e897e'),
(24, 28, 2, 1, 1, 3, '', '{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Proposal 1\",\"slug\":\"proposal-1\",\"postDate\":1529343360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"55\":[{\"col1\":\"Domain name registration\",\"col2\":\"$15 / year\"},{\"col1\":\"Hosting\",\"col2\":\"$25 / month\"},{\"col1\":\"CMS fee\",\"col2\":\"$299\"}],\"56\":\"[\\\"foo\\\"]\",\"43\":[\"24\"],\"47\":\"January 1, 2076\",\"54\":\"10\",\"52\":\"60\",\"57\":\"[\\\"bar\\\"]\",\"48\":\"<p>The Kent Historical Society and Museum brings educational programs to schools, businesses, and civic organizations, as well as collaborates with community groups on projects such as the preservation of our historic Pioneer Cemetery, the Main Street Kent revitalization program, and historic preservation projects in the community. The Society is dedicated to documenting Kent history through artifacts, records, and documents from the people of the Kent community. </p>\\n<p>The Kent Historical Society and Museum is seeking a website redesign in order to accomplish the following objectives:</p>\\n<ul><li>A professional and visually appealing design</li><li>Organized content with intuitive navigation</li><li>Brand consistency on the web with other branded materials</li><li>The ability for users to purchase books and photographs online</li><li>Calendar of events</li></ul>\",\"49\":{\"43\":{\"type\":\"element\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"description\":\"<p><strong>Branding and visual strategy</strong></p>\\n<p>IdeaBase will create branding, and accompanying visual strategy for The Kent Historical Society and Museum. IdeaBase will conduct a creative brief with the client in order to determine the objectives of the project and aid in the design. After the creative brief, IdeaBase will present 2-3 concepts for client approval. Once the final brand, tagline and visual strategy are approved, IdeaBase will integrate this visual strategy into the new website and provide the client with the files for future use across other media.</p>\\n\",\"estimatedHours\":\"40\"}},\"44\":{\"type\":\"element\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"description\":\"\\n<p><strong>Website design</strong></p>\\n<ul><li>\\nIdeaBase will design and develop a custom website site design using a Content Management System (CMS). IdeaBase will work with the client to choose a custom design.</li><li>The website will be populated with content (photography and copy) provided by the client using a content template provided by IdeaBase</li><li> IdeaBase will share design elements, layout and content for client approval throughout the design process. The final site will also be approved by the client prior to handoff.</li><li>The website will utilize responsive design and will be viewable in all modern browsers (Internet Explorer 11 and lower is not supported)</li><li> IdeaBase will provide timelines, milestones and approval opportunities throughout the lifetime of the project</li></ul>\",\"estimatedHours\":\"170\"}}},\"46\":\"1234project\",\"53\":[{\"col1\":\"Initial design\",\"col2\":\"End of February\"},{\"col1\":\"Website\",\"col2\":\"End of April\"}],\"60\":\"glyphix\"}}', '2018-06-18 19:45:36', '2018-06-18 19:45:36', '9f93a2f6-53b8-4397-96b7-5dad18c8f988');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2018-05-02 20:31:26', '2018-05-02 20:31:26', '169f571a-5810-482d-b786-6cc57d569b46'),
(2, 'Clients', '2018-06-18 17:36:43', '2018-06-18 17:36:50', 'dace3909-fc66-4519-8d11-7e4aa2d4d8f2'),
(3, 'Proposals', '2018-06-18 17:57:14', '2018-06-18 17:57:14', '25c958c5-1eb9-4703-a0ab-13b0d4aadd22'),
(4, 'Globals', '2018-06-18 18:12:03', '2018-06-18 18:12:03', '670c4a50-8cde-4585-903f-211d2a786a10');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(93, 10, 51, 19, 0, 1, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '2f2d6312-5f6d-4e1d-bb2c-cd8261295650'),
(94, 10, 51, 20, 0, 2, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '37dbc80c-83da-46e3-b965-db9e2a248aa4'),
(97, 11, 53, 21, 0, 1, '2018-05-09 18:46:01', '2018-05-09 18:46:01', '7f43c6bd-675a-473f-bded-1ab23eb965f6'),
(101, 12, 55, 25, 0, 1, '2018-05-09 19:03:14', '2018-05-09 19:03:14', 'ddcfc650-c733-40b9-b69a-f6d2efb482d0'),
(102, 12, 55, 22, 0, 2, '2018-05-09 19:03:14', '2018-05-09 19:03:14', '366e8903-ffcd-4f43-b7bc-bfd90d19d24b'),
(103, 12, 55, 23, 0, 3, '2018-05-09 19:03:14', '2018-05-09 19:03:14', '0ff32275-2c7b-48d6-9a71-8282c5ba6163'),
(104, 12, 55, 24, 0, 4, '2018-05-09 19:03:14', '2018-05-09 19:03:14', 'd1ba3089-944e-4622-886e-fc2e7e539867'),
(124, 1, 68, 2, 0, 1, '2018-06-18 16:57:24', '2018-06-18 16:57:24', '544f9b32-e137-44a7-8a87-66b2b53d94a3'),
(125, 1, 68, 1, 0, 2, '2018-06-18 16:57:24', '2018-06-18 16:57:24', '5217dbd0-4734-4f34-83cb-9184d452ba64'),
(152, 2, 83, 3, 0, 1, '2018-06-18 17:09:16', '2018-06-18 17:09:16', '1586afe8-d69f-4076-a222-8820cbff124d'),
(153, 3, 84, 4, 0, 1, '2018-06-18 17:09:16', '2018-06-18 17:09:16', 'ae3e903d-a239-4654-adf3-700d07d1a102'),
(154, 3, 84, 5, 0, 2, '2018-06-18 17:09:16', '2018-06-18 17:09:16', '1701c039-7d53-4af9-9b1b-d98e222f8647'),
(155, 4, 85, 6, 0, 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '306fc27a-1843-40c7-8249-94de5792d729'),
(156, 4, 85, 7, 0, 2, '2018-06-18 17:09:17', '2018-06-18 17:09:17', 'cf94b8d0-9dbd-484f-a123-5240b6882735'),
(157, 5, 86, 17, 0, 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '75b7d78a-58d6-4600-b236-4dca44819bb5'),
(158, 6, 87, 9, 0, 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '343c23d1-e17b-4166-831f-bcd77caf752f'),
(159, 6, 87, 10, 0, 2, '2018-06-18 17:09:17', '2018-06-18 17:09:17', 'c0a27ad8-5948-44f9-bc36-aaa190c64487'),
(160, 7, 88, 11, 0, 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', 'deb991ae-645e-4a96-9398-25017764f7ab'),
(161, 7, 88, 12, 0, 2, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '3d012fa4-c62a-41f6-a607-5abee4fc8e0e'),
(162, 8, 89, 13, 0, 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '7c7055f5-6ca9-470d-8b11-d2e2b51626b4'),
(163, 8, 89, 14, 0, 2, '2018-06-18 17:09:17', '2018-06-18 17:09:17', 'ef7fe98a-4424-4d4a-860f-d3aecaf615ee'),
(164, 8, 89, 15, 0, 3, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '2283974c-0121-4b2e-8c34-ef9628afdb24'),
(185, 14, 93, 26, 0, 1, '2018-06-18 17:57:47', '2018-06-18 17:57:47', '00f12564-f700-47ce-bbe4-dcbb4312d677'),
(186, 14, 93, 27, 0, 2, '2018-06-18 17:57:47', '2018-06-18 17:57:47', 'c07289e8-2b22-424c-a333-c6d742fe66db'),
(187, 14, 93, 35, 0, 3, '2018-06-18 17:57:47', '2018-06-18 17:57:47', '988aa71a-7a1d-4c48-ade1-3b7c3ff7ed0e'),
(197, 15, 96, 28, 0, 1, '2018-06-18 18:10:05', '2018-06-18 18:10:05', 'e2a182fd-b02c-4b51-b4aa-5b811ac50b76'),
(198, 15, 96, 29, 1, 2, '2018-06-18 18:10:05', '2018-06-18 18:10:05', 'd1c156f7-a984-4ab9-915d-2893b005948b'),
(199, 15, 96, 30, 1, 3, '2018-06-18 18:10:05', '2018-06-18 18:10:05', '71854239-a43a-45cd-b9b0-dcb42ed02e65'),
(200, 15, 96, 31, 0, 4, '2018-06-18 18:10:05', '2018-06-18 18:10:05', 'e01b24a5-111a-4d81-868f-311fe03d1832'),
(201, 15, 96, 42, 0, 5, '2018-06-18 18:10:05', '2018-06-18 18:10:05', '152716c0-d17b-4255-838c-7a18b905fa6f'),
(202, 15, 96, 32, 0, 6, '2018-06-18 18:10:05', '2018-06-18 18:10:05', '0efdb634-1057-4697-9634-b256b2a0e8f2'),
(203, 15, 96, 33, 0, 7, '2018-06-18 18:10:05', '2018-06-18 18:10:05', '0abd553f-f657-4eac-bc44-612965c96765'),
(204, 15, 96, 34, 0, 8, '2018-06-18 18:10:05', '2018-06-18 18:10:05', '110e2c8d-ec0c-4970-a86e-2212c0b40a08'),
(205, 16, 97, 36, 1, 1, '2018-06-18 18:10:19', '2018-06-18 18:10:19', 'a00f111e-1821-4641-bb79-4cdc56781b47'),
(206, 16, 97, 37, 0, 2, '2018-06-18 18:10:19', '2018-06-18 18:10:19', '4dbc178f-344b-4d62-9066-56be1ef718d8'),
(207, 16, 97, 38, 1, 3, '2018-06-18 18:10:19', '2018-06-18 18:10:19', '53811b39-56fd-484c-91c8-aa6d69771ff2'),
(208, 16, 97, 39, 1, 4, '2018-06-18 18:10:19', '2018-06-18 18:10:19', '21a57369-7b64-4050-8b69-be1e08e3afcb'),
(209, 16, 97, 40, 1, 5, '2018-06-18 18:10:19', '2018-06-18 18:10:19', 'b5835246-f455-489f-8d0f-aeb20918e774'),
(210, 16, 97, 41, 0, 6, '2018-06-18 18:10:19', '2018-06-18 18:10:19', '64305c19-5462-48af-a165-37bdd560007b'),
(217, 19, 104, 44, 1, 1, '2018-06-18 18:53:23', '2018-06-18 18:53:23', '804a4696-68e6-405c-a8d3-26b663356bec'),
(218, 17, 105, 44, 1, 1, '2018-06-18 18:53:31', '2018-06-18 18:53:31', 'fe50ce97-bfbb-4398-bdaf-b891bfcee0be'),
(219, 20, 106, 44, 1, 1, '2018-06-18 18:53:37', '2018-06-18 18:53:37', '049bdddb-e5c4-418c-8aa3-fc6c9a7b3135'),
(220, 18, 107, 44, 1, 1, '2018-06-18 18:53:42', '2018-06-18 18:53:42', '83abb603-160d-4ca6-9961-f1bd5c70d212'),
(225, 23, 110, 50, 0, 1, '2018-06-18 19:01:37', '2018-06-18 19:01:37', 'd4971073-fe34-4d7b-b472-434457d70f16'),
(226, 23, 110, 51, 0, 2, '2018-06-18 19:01:37', '2018-06-18 19:01:37', '41356123-003f-4fb8-b57f-4a026c2699c1'),
(245, 21, 115, 45, 1, 1, '2018-06-18 19:17:12', '2018-06-18 19:17:12', 'a9698424-c554-49d7-89a4-bee1a78c5468'),
(246, 21, 115, 58, 1, 2, '2018-06-18 19:17:12', '2018-06-18 19:17:12', '306e95c5-5349-45a2-ba5f-27f11358fd03'),
(247, 21, 115, 59, 0, 3, '2018-06-18 19:17:12', '2018-06-18 19:17:12', 'b13d30b0-3dd4-4ebb-972e-1892b5b1a42d'),
(248, 22, 116, 45, 1, 1, '2018-06-18 19:17:19', '2018-06-18 19:17:19', '5f4da356-e05f-4347-9890-a7ab98db90f8'),
(249, 22, 116, 58, 1, 2, '2018-06-18 19:17:19', '2018-06-18 19:17:19', '99ff670c-f9d8-477d-9944-cf2b13ebc29b'),
(250, 22, 116, 59, 0, 3, '2018-06-18 19:17:19', '2018-06-18 19:17:19', '7e20fc96-a21e-40b6-8351-f7a917493bfa'),
(251, 13, 117, 43, 1, 1, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '533258da-a4c5-4b53-9999-016ba7be29c6'),
(252, 13, 117, 60, 1, 2, '2018-06-18 19:19:56', '2018-06-18 19:19:56', 'd74feddc-1092-44cf-afdc-b9386ccf6a11'),
(253, 13, 117, 46, 0, 3, '2018-06-18 19:19:56', '2018-06-18 19:19:56', 'f039ab3f-921f-4156-9f9a-999f1ac4a34f'),
(254, 13, 117, 52, 1, 4, '2018-06-18 19:19:56', '2018-06-18 19:19:56', 'fc2e2ec7-4c02-4aa6-aa70-95213afb6c81'),
(255, 13, 117, 47, 1, 5, '2018-06-18 19:19:56', '2018-06-18 19:19:56', 'd1ed92ad-d4b7-42b3-994f-fbc14da4e571'),
(256, 13, 117, 48, 0, 6, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '506eff78-e597-4b4e-82b2-cf53d61df430'),
(257, 13, 117, 49, 1, 7, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '6bff9f56-0095-4a85-8abc-2bbde72a0816'),
(258, 13, 117, 53, 0, 8, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '04eda46b-a0d7-4059-bc75-09d2dfeefab2'),
(259, 13, 117, 54, 0, 9, '2018-06-18 19:19:56', '2018-06-18 19:19:56', 'eaeae0bb-68b1-4f5f-9108-764208d50dab'),
(260, 13, 117, 55, 0, 10, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '5bfa5b88-e6a3-4697-b2df-017f3ca73cf9'),
(261, 13, 117, 57, 0, 11, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '86ab91c8-3d6e-4550-aeab-51d9eb62c1ed'),
(262, 13, 117, 56, 0, 12, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '3c42d3bf-2e77-4502-9726-8825be0ceb24');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2018-05-02 20:42:28', '2018-06-18 16:57:24', '889b4735-9f44-468d-a20b-52ba58e8c496'),
(2, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-06-18 17:09:16', 'c3482c33-a57b-4351-9585-63e81b0ed316'),
(3, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-06-18 17:09:16', 'f629a9c7-89dc-4f89-a994-492fa2187b4a'),
(4, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-06-18 17:09:17', '9738cea7-5770-4354-902b-c76be71a5acc'),
(5, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-06-18 17:09:17', 'be64468c-17d8-496c-84c5-825bceb7603c'),
(6, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-06-18 17:09:17', 'bb98cafc-ffe3-4e1d-9a91-354a719fb741'),
(7, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-06-18 17:09:17', '7f8be928-2542-412d-9a6e-d5af863ad7dc'),
(8, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-06-18 17:09:17', '405cdbda-2931-4a69-b5ac-e912a05fbd6b'),
(9, 'craft\\elements\\Asset', '2018-05-07 19:45:09', '2018-05-09 19:25:10', 'cf0a419a-66e5-4213-9752-6a27e8ae11e8'),
(10, 'craft\\elements\\MatrixBlock', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '9df65db5-c17d-42a4-92bf-52dec0dcdcd0'),
(11, 'craft\\elements\\GlobalSet', '2018-05-07 20:19:03', '2018-05-09 18:46:01', '2e7fa616-70ba-4bb8-a1f0-075a3c9acbeb'),
(12, 'craft\\elements\\GlobalSet', '2018-05-07 20:19:06', '2018-05-09 19:03:14', '29e36447-3f7c-47fc-9e20-d80605f9f77d'),
(13, 'craft\\elements\\Entry', '2018-06-18 17:10:28', '2018-06-18 19:19:56', '645b9f1a-8ea0-4aca-af0d-287a37eb558f'),
(14, 'craft\\elements\\Category', '2018-06-18 17:11:11', '2018-06-18 17:57:47', '993c7970-92c9-4b74-877e-f0da942b2b03'),
(15, 'craft\\elements\\MatrixBlock', '2018-06-18 17:50:31', '2018-06-18 18:10:05', '0cf034cc-3d2c-4dee-b642-855145cc5ce3'),
(16, 'craft\\elements\\MatrixBlock', '2018-06-18 17:55:53', '2018-06-18 18:10:19', '73531c5f-acba-4e46-b98a-4b003db0231e'),
(17, 'craft\\elements\\GlobalSet', '2018-06-18 18:13:02', '2018-06-18 18:53:31', '9dcdd1d5-9513-4c73-9e02-3eb691df8458'),
(18, 'craft\\elements\\GlobalSet', '2018-06-18 18:13:20', '2018-06-18 18:53:42', '2b9e1b68-2190-4d8e-9792-a0d2ec8f3111'),
(19, 'craft\\elements\\GlobalSet', '2018-06-18 18:13:39', '2018-06-18 18:53:23', '61bf9b4b-c71c-4f86-ad12-8d5ad2d92b00'),
(20, 'craft\\elements\\GlobalSet', '2018-06-18 18:13:58', '2018-06-18 18:53:37', '01afd423-99bc-4840-9353-e92f912b9ddf'),
(21, 'craft\\elements\\GlobalSet', '2018-06-18 18:53:16', '2018-06-18 19:17:12', '60b79444-bc8b-46d6-bfe5-eefd5750755a'),
(22, 'craft\\elements\\GlobalSet', '2018-06-18 18:54:17', '2018-06-18 19:17:19', '8a585acd-a576-4cf2-abf2-0994bb2904ad'),
(23, 'craft\\elements\\MatrixBlock', '2018-06-18 19:01:37', '2018-06-18 19:01:37', '56144203-9d9b-4a37-ab6c-56a9d705c539');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(51, 10, 'Content', 1, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '020d520e-8af6-4b6e-b039-ab3316d380d7'),
(53, 11, 'Tab 1', 1, '2018-05-09 18:46:01', '2018-05-09 18:46:01', 'ba3bdfab-6108-4079-8f44-dcfa0658df4d'),
(55, 12, 'Tab 1', 1, '2018-05-09 19:03:14', '2018-05-09 19:03:14', '30543e4d-1abd-400c-9ac9-55e0611bba47'),
(68, 1, 'Tab 1', 1, '2018-06-18 16:57:24', '2018-06-18 16:57:24', '33eb64cf-2108-4afa-ae1b-09f39c22e978'),
(83, 2, 'Content', 1, '2018-06-18 17:09:16', '2018-06-18 17:09:16', '99ea334c-4975-4012-a129-baeefc465555'),
(84, 3, 'Content', 1, '2018-06-18 17:09:16', '2018-06-18 17:09:16', '7975dafe-1433-4078-8b32-7fb4dc85b9c4'),
(85, 4, 'Content', 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '5311beeb-f542-4b84-b39e-03883778e937'),
(86, 5, 'Content', 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '0c56b924-0234-43aa-8f98-c626f69dddcf'),
(87, 6, 'Content', 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', 'f201edd6-3e38-4c72-9e5e-a4019c94afdc'),
(88, 7, 'Content', 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '056624e8-87f6-4d96-b3fd-3e2a7b720111'),
(89, 8, 'Content', 1, '2018-06-18 17:09:17', '2018-06-18 17:09:17', '703be504-2139-4d40-ae48-211d60d7d464'),
(93, 14, 'Clients', 1, '2018-06-18 17:57:47', '2018-06-18 17:57:47', 'a1f70671-4fa4-4f1a-a6d1-6e610d3374f9'),
(96, 15, 'Content', 1, '2018-06-18 18:10:05', '2018-06-18 18:10:05', '1ca58324-4b8d-4ecf-ae60-cd6be9d62ab3'),
(97, 16, 'Content', 1, '2018-06-18 18:10:19', '2018-06-18 18:10:19', '3d05f079-48a5-4fc9-8564-9afb000bf692'),
(104, 19, 'Globals', 1, '2018-06-18 18:53:23', '2018-06-18 18:53:23', '2d53ca84-e83a-47ea-8850-6de39686e581'),
(105, 17, 'Globals', 1, '2018-06-18 18:53:31', '2018-06-18 18:53:31', '842403a3-29ba-4974-b465-1dbdd177e4be'),
(106, 20, 'Globals', 1, '2018-06-18 18:53:37', '2018-06-18 18:53:37', '03243827-4a99-4398-b688-95a8f8ab2e6d'),
(107, 18, 'Globals', 1, '2018-06-18 18:53:42', '2018-06-18 18:53:42', '0cbc12ea-0b16-4d82-b43e-487875fdbd9e'),
(110, 23, 'Content', 1, '2018-06-18 19:01:37', '2018-06-18 19:01:37', '1c580382-7c2c-4bd0-adff-d218e9bc1175'),
(115, 21, 'Globals', 1, '2018-06-18 19:17:12', '2018-06-18 19:17:12', 'f0ae52ec-2689-4f07-ba70-240edf98befb'),
(116, 22, 'Globals', 1, '2018-06-18 19:17:19', '2018-06-18 19:17:19', '97017b25-a6cb-40f7-a34f-19041819e2ab'),
(117, 13, 'Proposals', 1, '2018-06-18 19:19:56', '2018-06-18 19:19:56', '0243e59a-b2fa-41be-8cf7-b61e981723d7');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Body', 'body', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-02 20:46:29', '2018-05-02 20:46:29', '33457c4e-d15a-47cb-8aa9-7440cf88498c'),
(2, 1, 'Page Content', 'pageContent', 'global', '', 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"localizeBlocks\":false}', '2018-05-07 19:30:57', '2018-06-18 17:09:16', '17e29334-b847-45dc-a676-5f312b7197bd'),
(3, NULL, 'Body Text', 'bodyText', 'matrixBlockType:1', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:16', 'f779d60d-f36a-4d90-9994-9781dfbdca5f'),
(4, NULL, 'Button Text', 'buttonInternalText', 'matrixBlockType:2', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:16', '8b2def62-b99c-4d0e-ad71-cbffacc8bfb8'),
(5, NULL, 'Button URL', 'buttonInternalUrl', 'matrixBlockType:2', 'e.g. \"/clients\" or \"/proposals\"', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:16', '53abc2fe-1142-40ea-9f1c-151077446053'),
(6, NULL, 'Button Text', 'buttonExternalText', 'matrixBlockType:3', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:16', '7cac78e9-9bff-4ad9-aa4d-ae3b377b49f0'),
(7, NULL, 'Button URL', 'buttonExternalUrl', 'matrixBlockType:3', '', 'none', NULL, 'craft\\fields\\Url', '[]', '2018-05-07 19:30:58', '2018-06-18 17:09:16', '246d6bce-8a99-4a4d-a0ac-aca7818b59d8'),
(9, NULL, 'Video URL', 'videoUrl', 'matrixBlockType:5', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:17', '3e705071-9ac2-4651-bf62-4cf1291b8480'),
(10, NULL, 'Video Caption', 'videoCaption', 'matrixBlockType:5', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:17', '3db655d6-8e14-47c3-9809-d22776085aab'),
(11, NULL, 'Pull Quote', 'pullQuote', 'matrixBlockType:6', 'No need to put in quotation marks - we\'ll do that for you.', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:17', 'b68a860c-6f15-4fac-b9cc-796d05920b8c'),
(12, NULL, 'Pull Quote Author', 'pullQuoteAuthor', 'matrixBlockType:6', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:17', 'c90f9f1c-da69-44c5-8dab-c880db39c875'),
(13, NULL, 'Call Out Title', 'callOutTitle', 'matrixBlockType:7', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-06-18 17:09:17', '3e7f3a94-1e14-4b04-af65-ddf8834c878c'),
(14, NULL, 'Call Out Text', 'callOutText', 'matrixBlockType:7', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-07 19:31:26', '2018-06-18 17:09:17', 'edcf1d23-a598-48fb-97a2-c1e009af3d75'),
(15, NULL, 'Call Out Image', 'callOutImage', 'matrixBlockType:7', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-07 19:31:26', '2018-06-18 17:09:17', 'c010a3a8-4504-42dc-8077-ca3ac7ede1d8'),
(17, NULL, 'Image', 'image', 'matrixBlockType:4', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-07 20:02:25', '2018-06-18 17:09:17', '0cc70e17-df2a-42b0-af6f-9a57763d02bb'),
(18, 1, 'Social Matrix', 'socialMatrix', 'global', '', 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"localizeBlocks\":false}', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '7f98c71d-c65f-4566-8ce9-5baf7f47f661'),
(19, NULL, 'Social Name', 'socialName', 'matrixBlockType:8', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '522789ca-4f7f-4901-8714-32ee0802632e'),
(20, NULL, 'Social Handle', 'socialHandle', 'matrixBlockType:8', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '284f7a94-16ed-43b0-b3e1-f9325018f611'),
(21, 1, 'Header Logo', 'headerLogo', 'global', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-09 18:45:42', '2018-05-09 18:45:42', '477da3b6-a1b0-4234-9f8a-c562b568119a'),
(22, 1, 'Email', 'email', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-09 18:50:21', '2018-05-09 18:50:21', '0b30e2e4-9396-4125-893f-60b41b33e434'),
(23, 1, 'Phone Number', 'phoneNumber', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-09 18:50:32', '2018-05-09 18:50:32', '2a807176-ba96-43c0-bd9b-83af6e7030e4'),
(24, 1, 'Copyright', 'copyright', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-09 18:50:41', '2018-05-09 18:50:41', '8cc610ee-aaa5-497b-905f-9d246fb94649'),
(25, 1, 'Footer Image', 'footerImage', 'global', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-09 19:02:55', '2018-05-09 19:02:55', 'e67d64b7-976a-4009-9cc2-a5e4e6a70a95'),
(26, 2, 'Organization', 'organization', 'global', 'Is client is part of a larger organization? e.g. \"Kent State University\"', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:38:47', '2018-06-18 17:58:43', '2fc4b320-dc54-456c-80b5-86c82869445f'),
(27, 2, 'Contacts', 'contacts', 'global', 'Proposals will be addressed to the first contact', 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"localizeBlocks\":false}', '2018-06-18 17:50:31', '2018-06-18 18:10:05', '48fc4420-2441-46a3-acc4-9fa0561d78f3'),
(28, NULL, 'Prefix', 'prefix', 'matrixBlockType:9', 'e.g. \"Dr.\"', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:50:31', '2018-06-18 18:10:05', 'fed1dd33-1aed-4333-9067-84364c734bde'),
(29, NULL, 'First Name', 'firstName', 'matrixBlockType:9', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:50:31', '2018-06-18 18:10:05', 'f19396b9-69c7-4d98-bfe8-f05880764802'),
(30, NULL, 'Last Name', 'lastName', 'matrixBlockType:9', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:50:31', '2018-06-18 18:10:05', '0bc1aa96-7ef7-47ab-aa9e-8623f5ac3f78'),
(31, NULL, 'Suffix', 'suffix', 'matrixBlockType:9', 'e.g. \"Ph.D\"', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:50:31', '2018-06-18 18:10:05', '4b5fc595-61d3-4e3f-9685-5f56fa55a7f7'),
(32, NULL, 'Phone Number', 'phoneNumber', 'matrixBlockType:9', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:50:31', '2018-06-18 18:10:05', '99720fb8-e80e-4ffd-ad32-4ad4a424d19d'),
(33, NULL, 'Email', 'email', 'matrixBlockType:9', '', 'none', NULL, 'craft\\fields\\Email', '[]', '2018-06-18 17:50:31', '2018-06-18 18:10:05', 'fe082a2c-c59f-4c3f-a4a5-50e5e53f8272'),
(34, NULL, 'Other Information', 'otherInformation', 'matrixBlockType:9', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:50:31', '2018-06-18 18:10:05', '0f9fbb16-fae7-4396-ac49-5887b10eff27'),
(35, 2, 'Addresses', 'addresses', 'global', 'Proposals will include the first address', 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"localizeBlocks\":false}', '2018-06-18 17:55:53', '2018-06-18 18:10:19', 'be4722ef-255c-4be7-a7d2-521c8ce4cb63'),
(36, NULL, 'Address', 'address1', 'matrixBlockType:10', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:55:53', '2018-06-18 18:10:19', 'f54724cc-da59-41d0-9b5f-8d7752940077'),
(37, NULL, '__blank__', 'address2', 'matrixBlockType:10', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"apartment, suite, unit, building, floor, etc.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:55:53', '2018-06-18 18:10:19', 'fa5760e0-8015-4c97-b875-a6976847a761'),
(38, NULL, 'City', 'city', 'matrixBlockType:10', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:55:53', '2018-06-18 18:10:19', '5c75e954-40c2-4188-8646-f86999883dc6'),
(39, NULL, 'State', 'state', 'matrixBlockType:10', 'e.g. \"OH\"', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:55:53', '2018-06-18 18:10:19', '5726733b-4638-4486-83ef-25f7a1acdd30'),
(40, NULL, 'Zip Code', 'zipCode', 'matrixBlockType:10', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:55:53', '2018-06-18 18:10:19', '0cfcba00-3362-4516-8913-24533157778b'),
(41, NULL, 'Description', 'description', 'matrixBlockType:10', 'If the client has multiple addresses, enter a short description here', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 17:55:53', '2018-06-18 18:10:19', 'c1becdbe-0608-4871-b755-11cded3e105f'),
(42, NULL, 'Title', 'contactTitle', 'matrixBlockType:9', 'e.g. \"Director of Stuff\"', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 18:02:17', '2018-06-18 18:10:05', '8476ff97-e363-4a33-abbb-74ce8c41dd4a'),
(43, 3, 'Client', 'client', 'global', '', 'site', NULL, 'craft\\fields\\Categories', '{\"branchLimit\":\"\",\"sources\":\"*\",\"source\":\"group:1\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-06-18 18:06:21', '2018-06-18 18:07:11', '2ba23726-1ddc-4b7a-bd5d-7237eee0eead'),
(44, 4, 'Redactor', 'redactor', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-06-18 18:12:28', '2018-06-18 18:12:28', '7d5054db-4406-4d5d-8659-2d67991c60a2'),
(45, 4, 'Image', 'image', 'global', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-06-18 18:52:52', '2018-06-18 18:52:52', '7b63b352-a15d-4aa9-ab90-79226d5e1d47'),
(46, 3, 'Project ID', 'projectId', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 18:55:36', '2018-06-18 18:55:36', 'de6a60ec-5cda-4585-90a1-d3a77cfd498d'),
(47, 3, 'Date', 'date', 'global', 'Date that the proposal will be sent to the client, e.g. \"January 1, 2020\"', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 18:57:34', '2018-06-18 19:40:13', 'ba5ea0ca-20fb-438c-a329-e8afeab11587'),
(48, 3, 'Project Description (Situation)', 'situation', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-06-18 18:58:55', '2018-06-18 18:58:55', '50beae0b-9cb8-4e5b-8544-90451cc566b8'),
(49, 3, 'Project Elements', 'elements', 'global', '', 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"localizeBlocks\":false}', '2018-06-18 19:01:37', '2018-06-18 19:01:37', 'f6eb40b7-be65-4cb7-a927-48194f6574ec'),
(50, NULL, 'Description', 'description', 'matrixBlockType:11', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"Proposals.json\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-06-18 19:01:37', '2018-06-18 19:01:37', '2e399343-9e60-48d1-8419-e403ab3f2a69'),
(51, NULL, 'Estimated Hours', 'estimatedHours', 'matrixBlockType:11', '', 'none', NULL, 'craft\\fields\\Number', '{\"defaultValue\":null,\"min\":\"0\",\"max\":null,\"decimals\":0,\"size\":null}', '2018-06-18 19:01:37', '2018-06-18 19:01:37', '16684622-15b8-4e2c-976a-ce563a67721a'),
(52, 3, 'Hourly Rate', 'pricePerHour', 'global', '', 'none', NULL, 'craft\\fields\\Dropdown', '{\"options\":[{\"label\":\"$40\",\"value\":\"40\",\"default\":\"\"},{\"label\":\"$50\",\"value\":\"50\",\"default\":\"\"},{\"label\":\"$60\",\"value\":\"60\",\"default\":\"1\"},{\"label\":\"$70\",\"value\":\"70\",\"default\":\"\"}]}', '2018-06-18 19:03:01', '2018-06-18 19:03:01', '36b85be7-bc2a-4635-a2d6-5fa6bf9f5dbf'),
(53, 3, 'Project Timeline', 'timeline', 'global', '', 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Description\",\"handle\":\"description\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Time, e.g. \\\"End of May / Early June\\\"\",\"handle\":\"time\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\"}},\"columnType\":\"text\"}', '2018-06-18 19:05:51', '2018-06-18 19:05:51', 'c1408324-370c-4578-8731-6678664f64ed'),
(54, 3, 'Discount', 'discount', 'global', 'Number of discounted hours', 'none', NULL, 'craft\\fields\\Number', '{\"defaultValue\":null,\"min\":\"0\",\"max\":null,\"decimals\":0,\"size\":null}', '2018-06-18 19:07:39', '2018-06-18 19:07:39', '95f92909-4c2f-4f0d-914d-effffc470104'),
(55, 3, 'Additional Costs', 'additionalCosts', 'global', 'Enter any additional costs here', 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Description\",\"handle\":\"description\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Estimated Cost, e.g. \\\"$299\\\" or \\\"$15 / month\\\"\",\"handle\":\"estimatedCost\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\"}},\"columnType\":\"text\"}', '2018-06-18 19:12:44', '2018-06-18 19:46:17', 'b55ebbde-ba3a-4d9e-83be-36ecbd57e8eb'),
(56, 3, 'Allowance for Client Revisions', 'clientRevisions', 'global', '', 'none', NULL, 'craft\\fields\\Checkboxes', '{\"options\":[{\"label\":\"Display \\\"Please note this estimate allows for 2-3 client revisions. If more than 2-3 sets of client revisions are needed, additional hours will be added to the final invoice.\\\"\",\"value\":\"foo\",\"default\":\"1\"}]}', '2018-06-18 19:14:25', '2018-06-18 19:14:25', 'e199a141-c08d-442b-8918-06154c48ee32'),
(57, 3, 'Printing Costs', 'printingCosts', 'global', '', 'none', NULL, 'craft\\fields\\Checkboxes', '{\"options\":[{\"label\":\"Display \\\"Please note this estimate includes print coordination only, not actual printing costs.\\\"\",\"value\":\"bar\",\"default\":\"\"}]}', '2018-06-18 19:15:01', '2018-06-18 19:15:01', '15c24d95-8990-4575-ae9d-ac7586eb4939'),
(58, 4, 'Image Alt', 'imageAlt', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 19:15:39', '2018-06-18 19:15:39', 'c28e8d94-5485-4d35-a74d-a79f0e3c552c'),
(59, 4, 'Image Title', 'imageTitle', 'global', 'Optional title that appears on mouse hover', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-06-18 19:17:01', '2018-06-18 19:17:01', 'a5fbb4dc-e89e-4ebd-ac50-4fe04849db6a'),
(60, 3, 'Project Type', 'projectType', 'global', '', 'none', NULL, 'craft\\fields\\Dropdown', '{\"options\":[{\"label\":\"IdeaBase\",\"value\":\"ideabase\",\"default\":\"1\"},{\"label\":\"Glyphix\",\"value\":\"glyphix\",\"default\":\"\"}]}', '2018-06-18 19:18:21', '2018-06-18 19:18:21', '0c48a378-28cb-4fbc-beee-d9b72c57eb50');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_globalsets`
--

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(12, 'Header', 'header', 11, '2018-05-07 20:19:03', '2018-05-09 18:46:01', '98f4a7d5-d6dc-4474-bb31-35714554acc0'),
(13, 'Footer', 'footer', 12, '2018-05-07 20:19:06', '2018-05-09 19:03:14', 'ca28c278-e1c2-46ce-a89a-d9a5c3b6172b'),
(37, 'Proposal Contact', 'proposalContact', 17, '2018-06-18 18:13:02', '2018-06-18 18:53:32', '05c442eb-1767-4814-9aa8-e16d5b0ee291'),
(38, 'Proposal Working With IdeaBase', 'proposalWorking', 18, '2018-06-18 18:13:20', '2018-06-18 18:53:42', 'd9267ccb-57d9-40f3-afb6-4dbbae0d35f6'),
(39, 'Proposal Agreement', 'proposalAgreement', 19, '2018-06-18 18:13:39', '2018-06-18 18:53:23', '9bd56485-0397-44c8-ae8d-4aa1be01c980'),
(40, 'Proposal Terms', 'proposalTerms', 20, '2018-06-18 18:13:58', '2018-06-18 18:53:37', '1be9522e-44b2-4c84-b5f7-dfba605f9b8f'),
(41, 'Ideabase Logo', 'ideabaseLogo', 21, '2018-06-18 18:53:16', '2018-06-18 19:17:12', 'a4cd228e-8516-4d8a-98f1-37c537dcaf13'),
(42, 'Glyphix Logo', 'glyphixLogo', 22, '2018-06-18 18:54:17', '2018-06-18 19:17:19', '4a6a0150-469e-444b-bf5d-21a95d7bae01');

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `edition` tinyint(3) UNSIGNED NOT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `edition`, `timezone`, `name`, `on`, `maintenance`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.0.12', '3.0.91', 1, 'America/New_York', 'IdeaBase Online Proposal System', 1, 0, 'DfxdvBmLVGYR', '2018-05-02 20:31:26', '2018-06-18 19:46:17', 'bb4e3e64-e6ce-4490-ae25-923d04716360');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixblocks`
--

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `ownerSiteId`, `fieldId`, `typeId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(11, 2, NULL, 18, 8, 1, '2018-05-07 20:18:08', '2018-05-09 19:51:57', '0cc89d28-eb94-4cc8-a58a-19ffaf86fbed'),
(22, 2, NULL, 2, 2, 1, '2018-06-18 17:09:53', '2018-06-18 17:09:53', 'ac95a18f-b495-4893-9a02-edc02338387f'),
(23, 2, NULL, 2, 2, 2, '2018-06-18 17:09:53', '2018-06-18 17:09:53', '3d3d2cd5-dd6c-4ae5-afc8-5e18d99c9606'),
(31, 24, NULL, 27, 9, 1, '2018-06-18 17:59:38', '2018-06-18 18:03:02', '9f38b993-afe3-45bd-97bc-52ea2a368c59'),
(32, 24, NULL, 27, 9, 2, '2018-06-18 18:01:44', '2018-06-18 18:03:02', '7d878804-f329-4581-86b1-1df153b1e1d8'),
(33, 24, NULL, 35, 10, 1, '2018-06-18 18:01:44', '2018-06-18 18:03:02', 'db4baf4f-1351-4c42-bce9-909ae94ecca6'),
(34, 24, NULL, 35, 10, 2, '2018-06-18 18:03:02', '2018-06-18 18:03:02', 'ec16d64e-e7d2-4234-b6f1-c23c0a645f9b'),
(43, 28, NULL, 49, 11, 1, '2018-06-18 19:45:36', '2018-06-18 19:45:36', '1748d1b7-65f3-4962-a889-d88c4f434c4b'),
(44, 28, NULL, 49, 11, 2, '2018-06-18 19:45:36', '2018-06-18 19:45:36', 'b2c77fbf-84b7-4f19-afe0-c28677cb017a');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixblocktypes`
--

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 2, 'Body', 'body', 1, '2018-05-07 19:30:58', '2018-06-18 17:09:16', '01678f61-d124-469a-8c54-1d4fa4b65c26'),
(2, 2, 3, 'Button (Internal Link)', 'buttonInternal', 2, '2018-05-07 19:30:58', '2018-06-18 17:09:16', '8d3666dd-2d9d-481e-aee8-2c4eb27e235f'),
(3, 2, 4, 'Button (External Link)', 'buttonExternal', 3, '2018-05-07 19:30:58', '2018-06-18 17:09:17', '79b367aa-bffb-426c-a20f-b369fabf760d'),
(4, 2, 5, 'Image', 'image', 4, '2018-05-07 19:30:58', '2018-06-18 17:09:17', 'd34bcb04-7b27-4c57-bf01-3ba995e155f4'),
(5, 2, 6, 'Video', 'video', 5, '2018-05-07 19:30:58', '2018-06-18 17:09:17', 'c2d7ab57-249f-4411-a7df-fd48b63bc5a6'),
(6, 2, 7, 'Pull Quote', 'pullQuote', 6, '2018-05-07 19:30:58', '2018-06-18 17:09:17', '31602c40-bb81-4f6d-91d1-782f018839d3'),
(7, 2, 8, 'Call Out', 'callOut', 7, '2018-05-07 19:30:58', '2018-06-18 17:09:17', '0adedcb1-4561-4b1e-a359-de232f1bd592'),
(8, 18, 10, 'Social Block', 'socialBlock', 1, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '642dc902-d717-4670-906b-530e08e20694'),
(9, 27, 15, 'Contact', 'contact', 1, '2018-06-18 17:50:31', '2018-06-18 18:10:05', '5a79d25c-3076-47c2-a06c-74fba855e1ea'),
(10, 35, 16, 'Address', 'address', 1, '2018-06-18 17:55:53', '2018-06-18 18:10:19', 'f24187a1-b46a-4081-b0f3-a7272dd826a1'),
(11, 49, 23, 'Element', 'element', 1, '2018-06-18 19:01:37', '2018-06-18 19:01:37', '48a1b01a-b109-4f7d-b52e-9bb73ffa0ca2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_addresses`
--

CREATE TABLE `craft_matrixcontent_addresses` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_address_address1` text,
  `field_address_address2` text,
  `field_address_city` text,
  `field_address_state` text,
  `field_address_zipCode` text,
  `field_address_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixcontent_addresses`
--

INSERT INTO `craft_matrixcontent_addresses` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_address_address1`, `field_address_address2`, `field_address_city`, `field_address_state`, `field_address_zipCode`, `field_address_description`) VALUES
(1, 33, 1, '2018-06-18 18:01:44', '2018-06-18 18:03:02', '0ea88428-fba2-4a5c-8bc7-0e53366d49bb', '138 E Main St', '#203', 'Kent', 'OH', '44224', 'Main address.'),
(2, 34, 1, '2018-06-18 18:03:02', '2018-06-18 18:03:02', '7995f119-114e-4306-863e-50ae9029e058', '123 E Main St', NULL, 'Kent', 'OH', '44224', 'Other address.');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_contacts`
--

CREATE TABLE `craft_matrixcontent_contacts` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_contact_prefix` text,
  `field_contact_firstName` text,
  `field_contact_lastName` text,
  `field_contact_suffix` text,
  `field_contact_phoneNumber` text,
  `field_contact_email` varchar(255) DEFAULT NULL,
  `field_contact_otherInformation` text,
  `field_contact_contactTitle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixcontent_contacts`
--

INSERT INTO `craft_matrixcontent_contacts` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_contact_prefix`, `field_contact_firstName`, `field_contact_lastName`, `field_contact_suffix`, `field_contact_phoneNumber`, `field_contact_email`, `field_contact_otherInformation`, `field_contact_contactTitle`) VALUES
(1, 31, 1, '2018-06-18 17:59:38', '2018-06-18 18:03:02', 'dbfb2fa3-57bc-4d63-84fd-a1f52f3c3a74', 'Dr.', 'Foo', 'Bar', 'Ph.D', '(330) 123-4567', 'foobar@not.email', 'Other information goes here.', 'Chairman of Nothing'),
(2, 32, 1, '2018-06-18 18:01:44', '2018-06-18 18:03:02', 'f00a5725-01fa-4825-a4e3-c07e7c60abd6', 'Mr.', 'Something', 'Else', 'III', '(987) 654-3210', 'something@else.com', NULL, 'Director of Stuff');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_elements`
--

CREATE TABLE `craft_matrixcontent_elements` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_element_description` text,
  `field_element_estimatedHours` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixcontent_elements`
--

INSERT INTO `craft_matrixcontent_elements` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_element_description`, `field_element_estimatedHours`) VALUES
(1, 43, 1, '2018-06-18 19:45:36', '2018-06-18 19:45:36', '58e61677-099c-469c-a388-56d1e8fc5db5', '<p><strong>Branding and visual strategy</strong></p>\n<p>IdeaBase will create branding, and accompanying visual strategy for The Kent Historical Society and Museum. IdeaBase will conduct a creative brief with the client in order to determine the objectives of the project and aid in the design. After the creative brief, IdeaBase will present 2-3 concepts for client approval. Once the final brand, tagline and visual strategy are approved, IdeaBase will integrate this visual strategy into the new website and provide the client with the files for future use across other media.</p>\n', 40),
(2, 44, 1, '2018-06-18 19:45:36', '2018-06-18 19:45:36', '261a2a9d-6a19-4459-bde3-97b69c96a446', '\n<p><strong>Website design</strong></p>\n<ul><li>\nIdeaBase will design and develop a custom website site design using a Content Management System (CMS). IdeaBase will work with the client to choose a custom design.</li><li>The website will be populated with content (photography and copy) provided by the client using a content template provided by IdeaBase</li><li> IdeaBase will share design elements, layout and content for client approval throughout the design process. The final site will also be approved by the client prior to handoff.</li><li>The website will utilize responsive design and will be viewable in all modern browsers (Internet Explorer 11 and lower is not supported)</li><li> IdeaBase will provide timelines, milestones and approval opportunities throughout the lifetime of the project</li></ul>', 170);

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_pagecontent`
--

CREATE TABLE `craft_matrixcontent_pagecontent` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body_bodyText` text,
  `field_buttonInternal_buttonInternalText` text,
  `field_buttonExternal_buttonExternalText` text,
  `field_buttonExternal_buttonExternalUrl` varchar(255) DEFAULT NULL,
  `field_video_videoUrl` text,
  `field_video_videoCaption` text,
  `field_pullQuote_pullQuote` text,
  `field_pullQuote_pullQuoteAuthor` text,
  `field_callOut_callOutTitle` text,
  `field_callOut_callOutText` text,
  `field_buttonInternal_buttonInternalUrl` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixcontent_pagecontent`
--

INSERT INTO `craft_matrixcontent_pagecontent` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_body_bodyText`, `field_buttonInternal_buttonInternalText`, `field_buttonExternal_buttonExternalText`, `field_buttonExternal_buttonExternalUrl`, `field_video_videoUrl`, `field_video_videoCaption`, `field_pullQuote_pullQuote`, `field_pullQuote_pullQuoteAuthor`, `field_callOut_callOutTitle`, `field_callOut_callOutText`, `field_buttonInternal_buttonInternalUrl`) VALUES
(11, 22, 1, '2018-06-18 17:09:53', '2018-06-18 17:09:53', 'c79215c8-5c0a-46f0-9b39-f697c3217c37', NULL, 'Clients', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/clients'),
(12, 23, 1, '2018-06-18 17:09:53', '2018-06-18 17:09:53', '661cf419-572b-44ca-be78-4e490932caf2', NULL, 'Proposals', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/proposals');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_socialmatrix`
--

CREATE TABLE `craft_matrixcontent_socialmatrix` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_socialBlock_socialName` text,
  `field_socialBlock_socialHandle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixcontent_socialmatrix`
--

INSERT INTO `craft_matrixcontent_socialmatrix` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_socialBlock_socialName`, `field_socialBlock_socialHandle`) VALUES
(1, 11, 1, '2018-05-07 20:18:08', '2018-05-09 19:51:57', 'e41ddef2-fe14-42d2-97e6-3d326f745206', 'Facebook', 'https://www.google.com');

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f0177a61-7f22-43ea-955d-1e60e20f6729'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a9baf977-97f9-47e2-b175-29b284dbae3e'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'dc57a6b2-a764-482b-9b85-2bc38da967fc'),
(4, NULL, 'app', 'm150403_184533_field_version', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a1696d51-bd70-41b9-b6b6-4352b4f68bba'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f136adf7-18f6-40ce-adc1-0eb05485e773'),
(6, NULL, 'app', 'm150403_185142_volumes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '8fd58df0-0487-42c6-9d3f-6300461c9849'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '5f39d910-85af-43b6-aeca-d4d7120e4522'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f1af9a19-4eef-4471-bba7-b84a7f5533ff'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '0af0d5eb-6a60-4a03-a1da-72a15ed0b8b7'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '76d99301-f240-42b1-88c9-7cde5846a3ea'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'dd8a85a6-e957-4be8-8657-8ff3651ab9a6'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'e48a74f8-a89f-44ce-8834-0dcd747a8232'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'ddf23a9a-9602-4ca8-bf1d-01a637da246e'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '80b25c1d-b380-4416-b326-7aacea8fb227'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '9543384b-1814-4942-a88e-7fd40a8e9099'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '79616d6e-37f0-4d49-9cc7-2f794b9d03ae'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'fe570afa-4301-48d1-a5a5-9a77ebe12405'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '6e0f138a-2d05-4684-9840-8e63f3ba0c3b'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '1f179f11-17f2-4704-84c9-deca68e462e4'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '540f4b1f-2614-4920-81ce-320badf5fb8f'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '07dd65e4-6862-4e66-a818-513cb379da55'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd941c82c-275f-4271-86a2-ca2d27c4fe15'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '83ff4ec5-c554-4e8a-acde-28008a0d9456'),
(24, NULL, 'app', 'm160807_144858_sites', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '4a125e81-a0a9-43b3-993b-77aad0b9a5a1'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '19466dc8-2a6b-41b1-846b-ce5b7396ca30'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'b6c82561-7cbe-4eb6-a67e-84027237b7fb'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '3a72571f-8547-4314-8173-6f8126f8d816'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '37b03b58-756a-4ebf-95ce-df62ef602d67'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '63f4da32-96f3-47b2-848c-6794093daee5'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f7ac1aa0-fe33-4021-a8bb-e66f6c37f8d8'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'b7946cea-f101-4e01-ac29-eaea146c0374'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '221c7aad-8ed5-49a0-b132-eeb00e08efdf'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '055b6f0c-bd18-4b76-a293-b81a692af6fc'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '52f59962-8b29-4a7d-a4ca-854098b3e4b6'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '6abe32d7-3d9f-4ed0-9cc9-0588b4f89585'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '81e365cd-3801-4164-89a8-5a6dd76b0e34'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '644d1f50-9d85-4506-9cac-c161e34a1a4a'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '8ff100bc-7a8c-41d3-a4a6-d4f055694b41'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '5ede0cb3-9158-4a61-b150-d7bf30e3ce1f'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'e1bdf999-6dad-460b-99dd-c342c6d92df1'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a596e0e7-118c-43df-a83f-5d543d17336c'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '32676df8-8901-4335-90ff-985b8858ceca'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '464d68bb-7399-45c3-9605-7ba584864ccb'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f0f17eba-bd15-4bf8-9d7c-70f639950f54'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a5f24cbe-1b5b-47e1-ba1e-05a92194131c'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2d3c0547-80c0-4039-b1a8-e904302f5875'),
(47, NULL, 'app', 'm170206_142126_system_name', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f6290d0d-314a-44ea-aa43-02aa93682864'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'fbf7cc5e-320b-4635-99a0-93344543e060'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '12b673ea-7bed-44a8-85d3-ac084f687a2b'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '09f70baa-698b-4a4b-a6d1-333bdda4972a'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '1040c030-15bb-4f9d-9dfd-ec99ec77b1e8'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '01f05764-9d5c-4f6d-bd25-2dc361dd4790'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '487398f3-0dcf-46c8-92e9-493fe0df7a70'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '802dd6e9-cb25-4735-b7da-1fe44c270743'),
(55, NULL, 'app', 'm170414_162429_rich_text_config_setting', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '59aadb4e-244a-4699-8135-b00726423758'),
(56, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'df586e22-a9d3-4fca-972a-e72beab03caf'),
(57, NULL, 'app', 'm170612_000000_route_index_shuffle', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '473b8a4b-f2b5-4a1d-ad16-628cfb529cac'),
(58, NULL, 'app', 'm170621_195237_format_plugin_handles', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '9757e853-beff-42b7-a765-5cbab7d6ba65'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd2d5ffb5-8882-4796-be1b-4d39a3f2530b'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '4f43e191-822b-40c7-94fd-106ebbeca0ad'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '4a5d8c80-4d53-4a5d-a3ed-cc01ad293a82'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd748e787-fd21-46eb-bb46-9021a0a85c31'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '8fbc43c1-cdb8-4439-9aac-19b641844e4c'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f30c4453-b6f1-4992-8085-83b86060dcdc'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd420becb-1b47-4923-870f-43114763a79e'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'dd0cb768-766a-4eff-a53a-7008faea02d0'),
(67, NULL, 'app', 'm170821_180624_deprecation_line_nullable', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '30747a60-ae0e-4c65-bb53-01e0eb4b8d1d'),
(68, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'ba24dbb3-fcab-45d5-ac31-4e94ab93d996'),
(69, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '0fea5a9c-740b-48c1-9bbe-c17d526aee27'),
(70, NULL, 'app', 'm171011_214115_site_groups', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a7496f82-85af-4b5e-a824-c2c0168cb383'),
(71, NULL, 'app', 'm171012_151440_primary_site', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'e54bcfd6-ff7a-4650-a0c3-c9235ab0b8d4'),
(72, NULL, 'app', 'm171013_142500_transform_interlace', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'df691ecb-2666-4959-9647-09b50cf3703b'),
(73, NULL, 'app', 'm171016_092553_drop_position_select', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '1436d6c5-a6cd-4c94-a539-7f965d82229f'),
(74, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '65762e18-3b65-4341-817d-98f25bde578b'),
(75, NULL, 'app', 'm171107_000000_assign_group_permissions', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'b87b13dd-6f77-4454-9c28-347662970db1'),
(76, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2c38c09a-7757-42b3-a742-97d0d8dc20e2'),
(77, NULL, 'app', 'm171126_105927_disabled_plugins', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '1476bea3-e6b4-45cb-b20a-de9a4bc149c0'),
(78, NULL, 'app', 'm171130_214407_craftidtokens_table', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '5cdb6563-179c-4109-ae4b-169eef79b9f5'),
(79, NULL, 'app', 'm171202_004225_update_email_settings', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '5ae04520-09db-4c89-b00e-ed2f1115a603'),
(80, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'bdc0b4ad-a1e9-4edc-a3b3-0e3295c22b0a'),
(81, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '4712c9ee-1526-4d8b-8961-7e5ec8aba57e'),
(82, NULL, 'app', 'm171218_143135_longtext_query_column', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '7fdf176a-ccfd-402d-a890-7b36dd64d7f3'),
(83, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '453c95de-6664-4b84-8ed2-09170c4b83d9'),
(84, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'd5a6ccb6-f60e-48b4-86e4-adfce3876d9d'),
(85, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '55639851-f747-48af-bef2-80fd56169466'),
(86, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '8b97b351-1d11-40b7-8de5-20967e01dad6'),
(87, NULL, 'app', 'm180128_235202_set_tag_slugs', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'eac96ed8-f1e3-401d-a305-0bb0982c9bb4'),
(88, NULL, 'app', 'm180202_185551_fix_focal_points', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '46139dce-e8bb-49d1-8a20-8d4d1c1dd81f'),
(89, NULL, 'app', 'm180217_172123_tiny_ints', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '280f016e-0c15-44b0-9bac-204f673d1622'),
(90, NULL, 'app', 'm180321_233505_small_ints', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'bd53a886-e236-4730-ab6d-d586ffe2efea'),
(91, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '4c160b62-4482-4b9c-baed-15cb54459d24'),
(92, NULL, 'app', 'm180404_182320_edition_changes', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '3312ff27-030b-4d2b-8933-1722235630dd'),
(93, NULL, 'app', 'm180411_102218_fix_db_routes', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '4778cd65-6456-41cb-96df-5ed29f4e89d8'),
(94, NULL, 'app', 'm180416_205628_resourcepaths_table', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '438620c4-5744-4eec-8a5f-31118beee281'),
(95, NULL, 'app', 'm180418_205713_widget_cleanup', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '1df40b45-f163-4f0a-9151-d7a1ba0139d3'),
(96, 1, 'plugin', 'Install', '2018-05-02 20:43:38', '2018-05-02 20:43:38', '2018-05-02 20:43:38', '92c7a610-149b-448a-9885-320ad9f93a98'),
(97, 1, 'plugin', 'm180430_204710_remove_old_plugins', '2018-05-02 20:43:39', '2018-05-02 20:43:39', '2018-05-02 20:43:39', 'bca9d811-6247-4590-b87c-1ad32d514f47');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKey` char(24) DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_plugins`
--

INSERT INTO `craft_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.1.0', '2.0.0', NULL, 'unknown', 1, NULL, '2018-05-02 20:43:38', '2018-05-02 20:43:38', '2018-06-18 19:22:30', '9a8c417b-918c-458e-a659-ff5ee5d4417d'),
(2, 'admin-bar', '3.1.5', '3.1.0', NULL, 'unknown', 1, '{\"customCss\":\"\",\"customLinks\":[{\"linkLabel\":\"\",\"linkUrl\":\"\",\"adminOnly\":\"\"}],\"additionalLinks\":[],\"displayGreeting\":true,\"displayDashboardLink\":true,\"displayDefaultEditSection\":true,\"displaySettingsLink\":true,\"displayLogout\":true,\"enableMobileMenu\":true,\"widgets\":{\"admin-bar_edit-links\":\"\"},\"displayEditDate\":true,\"displayEditAuthor\":true,\"displayRevisionNote\":true}', '2018-05-02 20:43:57', '2018-05-02 20:43:57', '2018-05-09 20:41:37', 'ec3cede6-5451-4d33-8c0c-bbb6fde5b28a'),
(3, 'video-embedder', '1.0.9', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-07 19:35:58', '2018-05-07 19:35:58', '2018-05-09 20:41:37', '47ebbb4f-c37d-4d8a-b0e4-c4440ea28a66'),
(4, 'cp-field-inspect', '1.0.4', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 19:32:53', '2018-05-09 19:32:53', '2018-05-09 20:41:37', '2a9c99ab-b4d9-42fe-964a-fc261ea23f56'),
(5, 'redactor-clips', '2.0.0', '1.0.0', NULL, 'unknown', 1, NULL, '2018-06-18 16:47:04', '2018-06-18 16:47:04', '2018-06-18 19:22:30', '1f5b7736-ac0c-47b4-958c-dc3fa2e4ba51');

-- --------------------------------------------------------

--
-- Table structure for table `craft_queue`
--

CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_relations`
--

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(37, 45, 41, NULL, 36, 1, '2018-06-18 19:17:12', '2018-06-18 19:17:12', 'dba244a9-2704-43af-885e-2894f621a6a7'),
(38, 45, 42, NULL, 35, 1, '2018-06-18 19:17:19', '2018-06-18 19:17:19', 'd3c9f967-a7a0-494d-8170-0928b33d644b'),
(40, 43, 28, NULL, 24, 1, '2018-06-18 19:45:35', '2018-06-18 19:45:35', '13a1a9c0-9d2e-4c69-a51e-ba982c36e585');

-- --------------------------------------------------------

--
-- Table structure for table `craft_resourcepaths`
--

CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_resourcepaths`
--

INSERT INTO `craft_resourcepaths` (`hash`, `path`) VALUES
('101647dd', '@app/web/assets/updates/dist'),
('10431919', '@app/web/assets/updates/dist'),
('12e1d259', '@lib/selectize'),
('1437812f', '@craft/redactorclips/lib'),
('14e78f96', '@lib/selectize'),
('17ab1fc0', '@craft/web/assets/updateswidget/dist'),
('188d96d3', '@lib/xregexp'),
('198a5993', '@lib/garnishjs'),
('19babddf', '@vendor/craftcms/redactor/lib/redactor-plugins/fullscreen'),
('19df0757', '@lib/garnishjs'),
('1e8bcb1c', '@lib/xregexp'),
('203a365c', '@app/web/assets/matrix/dist'),
('206f6898', '@app/web/assets/matrix/dist'),
('218252e5', '@mmikkel/cpfieldinspect/resources'),
('21b0580f', '@lib/prismjs'),
('23365286', '@lib/jquery-touch-events'),
('23630c42', '@lib/jquery-touch-events'),
('241bf635', '@craft/web/assets/tablesettings/dist'),
('24926e44', '@lib/picturefill'),
('24c73080', '@lib/picturefill'),
('25fd17e8', '@wbrowar/adminbar/assetbundles/adminbar/dist'),
('26577dc1', '@runtime/assets/thumbs/19'),
('2772cea6', '@lib/timepicker'),
('29115dae', '@craft/web/assets/recententries/dist'),
('2a374e15', '@lib/d3'),
('2a6210d1', '@lib/d3'),
('2bbedcf', '@runtime/assets/thumbs/18'),
('2c315e43', '@craft/web/assets/utilities/dist'),
('2f181468', '@app/web/assets/editentry/dist'),
('2f4d4aac', '@app/web/assets/editentry/dist'),
('30a3078f', '@app/web/assets/dbbackup/dist'),
('30f6594b', '@app/web/assets/dbbackup/dist'),
('360b4fb9', '@runtime/assets/thumbs/7'),
('36633ba3', '@app/web/assets/plugins/dist'),
('3825fb80', '@app/web/assets/clearcaches/dist'),
('389051e6', '@runtime/assets/thumbs/36'),
('3c2f317e', '@lib/fileupload'),
('3c7a6fba', '@lib/fileupload'),
('3e23a64f', '@app/web/assets/clearcaches/dist'),
('400b0030', '@runtime/assets/thumbs/9'),
('4099a212', '@lib/picturefill'),
('413bc31f', '@lib/jquery-touch-events'),
('42651f3e', '@app/web/assets/sites/dist'),
('43bdc996', '@lib/prismjs'),
('452a01fb', '@lib/timepicker'),
('457f5f3f', '@lib/timepicker'),
('45bb9459', '@lib/prismjs'),
('469fffdd', '@lib/picturefill'),
('473d9ed0', '@lib/jquery-touch-events'),
('483adf8c', '@lib/d3'),
('4aef62c', '@craft/web/assets/pluginstore/dist'),
('4be0f993', '@app/web/assets/dbbackup/dist'),
('4d759b7b', '@app/web/assets/plugins/dist'),
('4e3c8243', '@lib/d3'),
('5207fd76', '@craft/web/assets/recententries/dist'),
('540eb4b0', '@app/web/assets/editentry/dist'),
('54fd951d', '@app/web/assets/dbbackup/dist'),
('5727fe9b', '@craft/web/assets/utilities/dist'),
('5871a3ec', '@lib/fileupload'),
('5b2c9684', '@app/web/assets/matrix/dist'),
('5bc4bb29', '@craft/web/assets/updater/dist'),
('5c2e37d6', '@app/web/assets/clearcaches/dist'),
('5e77fe23', '@lib/fileupload'),
('5f45025e', '@craft/web/assets/findreplace/dist'),
('6765387f', '@app/web/assets/edituser/dist'),
('68c741fb', '@lib/fabric'),
('6a29083b', '@app/web/assets/deprecationerrors/dist'),
('6b55b9c1', '@app/web/assets/updates/dist'),
('6bb51a3e', '@app/web/assets/dashboard/dist'),
('6cbdbf18', '@craft/web/assets/updateswidget/dist'),
('6ec11c34', '@lib/fabric'),
('70b91d04', '@lib/selectize'),
('70ec43c0', '@lib/selectize'),
('73cf58fe', '@app/web/assets/fields/dist'),
('7448d54f', '@app/web/assets/updates/dist'),
('74a876b0', '@app/web/assets/dashboard/dist'),
('753464b5', '@app/web/assets/deprecationerrors/dist'),
('76c36689', '@craft/web/assets/cp/dist'),
('7a80074a', '@lib/xregexp'),
('7ad5598e', '@lib/xregexp'),
('7b87c80a', '@lib/garnishjs'),
('7d8195c5', '@lib/garnishjs'),
('7fb856f4', '@craft/web/assets/pluginstore/dist'),
('80f6310e', '@app/web/assets/generalsettings/dist'),
('84070f20', '@app/web/assets/updater/dist'),
('8437d931', '@app/web/assets/matrixsettings/dist'),
('846287f5', '@app/web/assets/matrixsettings/dist'),
('855a3d28', '@runtime/assets/thumbs/35'),
('85dd9d50', '@app/web/assets/craftsupport/dist'),
('87a8f936', '@lib/element-resize-detector'),
('87ebd0f2', '@vendor/craftcms/redactor/lib/redactor-plugins/clips'),
('87fda7f2', '@lib/element-resize-detector'),
('88ca6e2', '@app/web/assets/fields/dist'),
('8c60217d', '@app/web/assets/findreplace/dist'),
('8d47529e', '@craft/web/assets/dashboard/dist'),
('8d9f826', '@app/web/assets/fields/dist'),
('8dcaecb3', '@vendor/craftcms/redactor/lib/redactor'),
('8f12d48d', '@craft/web/assets/feed/dist'),
('8f88fbda', '@runtime/assets/thumbs/14'),
('9012933b', '@lib'),
('928db1f2', '@craft/web/assets/matrixsettings/dist'),
('92b62f72', '@craft/web/assets/plugins/dist'),
('9315f24d', '@lib/jquery-ui'),
('94525d1f', '@app/web/assets/updateswidget/dist'),
('9513af82', '@lib/jquery-ui'),
('9ac0f1de', '@app/web/assets/craftsupport/dist'),
('a46a00af', '@vendor/craftcms/redactor/lib/redactor'),
('a5900a56', '@lib/jquery.payment'),
('a5c55492', '@lib/jquery.payment'),
('a7b7ea2e', '@app/web/assets/tablesettings/dist'),
('a7e2b4ea', '@app/web/assets/tablesettings/dist'),
('a83852c3', '@bower/jquery/dist'),
('a86d0c07', '@bower/jquery/dist'),
('a8b85472', '@app/web/assets/cp/dist'),
('aae81f71', '@app/web/assets/recententries/dist'),
('ac86410c', '@app/web/assets/login/dist'),
('ac9d75d7', '@app/web/assets/pluginstore/dist'),
('ae9d8471', '@app/web/assets/utilities/dist'),
('aec8dab5', '@app/web/assets/utilities/dist'),
('b007e9c9', '@craft/web/assets/craftsupport/dist'),
('b079ac58', '@app/web/assets/userpermissions/dist'),
('b2c4bc62', '@craft/web/assets/deprecationerrors/dist'),
('b4960dc8', '@craft/web/assets/updates/dist'),
('b572c364', '@runtime/assets/thumbs/19'),
('b5a8d39a', '@app/web/assets/feed/dist'),
('b5f573ff', '@app/web/assets/recententries/dist'),
('b5fd8d5e', '@app/web/assets/feed/dist'),
('b7a538fc', '@app/web/assets/cp/dist'),
('b9b7a5be', '@lib/velocity'),
('b9e2fb7a', '@lib/velocity'),
('bb1de430', '@app/web/assets/searchindexes/dist'),
('c094440', '@craft/web/assets/fields/dist'),
('c1866e1d', '@craft/web/assets/dbbackup/dist'),
('c19bc600', '@lib/jquery.payment'),
('c317fedc', '@craft/web/assets/login/dist'),
('c6ca0a24', '@runtime/assets/thumbs/16'),
('c79d9bcf', '@lib/jquery.payment'),
('c88d8d5a', '@app/web/assets/login/dist'),
('c8d8d39e', '@app/web/assets/login/dist'),
('c99d369', '@lib/fabric'),
('c9d21cba', '@craft/web/assets/deprecationerrors/dist'),
('ca35c35a', '@bower/jquery/dist'),
('cac316e3', '@app/web/assets/utilities/dist'),
('cb114911', '@craft/web/assets/craftsupport/dist'),
('cc339e95', '@bower/jquery/dist'),
('ccb39824', '@app/web/assets/cp/dist'),
('ccc8dad', '@lib/fabric'),
('cce6c6e0', '@app/web/assets/cp/dist'),
('cebe7342', '@app/web/assets/feed/dist'),
('cf80ad10', '@craft/web/assets/updates/dist'),
('d1a31fcc', '@app/web/assets/feed/dist'),
('d1abe16d', '@app/web/assets/recententries/dist'),
('d1febfa9', '@app/web/assets/recententries/dist'),
('d5de7a6d', '@app/web/assets/utilities/dist'),
('d78bd50f', '@app/web/assets/pluginstore/dist'),
('d9309d2f', '@craft/redactor/assets/field/dist'),
('dbba3427', '@lib/velocity'),
('dcf41432', '@app/web/assets/tablesettings/dist'),
('dd5c651', '@craft/web/assets/cp/dist'),
('ddbc69e8', '@lib/velocity'),
('de65e6bc', '@app/web/assets/assetindexes/dist'),
('e1830fc2', '@app/web/assets/craftsupport/dist'),
('e1d65106', '@app/web/assets/craftsupport/dist'),
('e3a33560', '@lib/element-resize-detector'),
('e5a568af', '@lib/element-resize-detector'),
('ef11a303', '@app/web/assets/updateswidget/dist'),
('ef44fdc7', '@app/web/assets/updateswidget/dist'),
('f06a5cba', '@app/web/assets/editcategory/dist'),
('f0907133', '@craft/redactor/assets/field/dist'),
('f21f02a2', '@lib'),
('f4047455', '@craft/web/assets/feed/dist'),
('f41db42d', '@craft/web/assets/clearcaches/dist'),
('f651f246', '@craft/web/assets/dashboard/dist'),
('f71e3e1b', '@lib/jquery-ui'),
('f74b60df', '@lib/jquery-ui'),
('fbe091d6', '@app/web/assets/generalsettings/dist'),
('fbed668', '@app/web/assets/dashboard/dist'),
('feb88ac', '@app/web/assets/dashboard/dist'),
('ff11aff8', '@app/web/assets/updater/dist'),
('ff74272d', '@app/web/assets/matrixsettings/dist');

-- --------------------------------------------------------

--
-- Table structure for table `craft_routes`
--

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `uriParts` varchar(255) NOT NULL,
  `uriPattern` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(35, 'extension', 0, 1, ' svg '),
(35, 'filename', 0, 1, ' glyphix_logo_color 01 svg '),
(25, 'slug', 0, 1, ' b client '),
(25, 'title', 0, 1, ' b client '),
(2, 'slug', 0, 1, ' home page '),
(2, 'title', 0, 1, ' home '),
(2, 'field', 2, 1, ' clients clients proposals proposals '),
(2, 'field', 1, 1, ''),
(12, 'slug', 0, 1, ''),
(12, 'field', 21, 1, ''),
(24, 'slug', 0, 1, ' a client '),
(24, 'title', 0, 1, ' a client '),
(13, 'slug', 0, 1, ''),
(13, 'field', 25, 1, ' logo '),
(13, 'field', 22, 1, ' testemail email com '),
(13, 'field', 23, 1, ' 911 '),
(13, 'field', 24, 1, ' copyright nick pappas '),
(11, 'slug', 0, 1, ''),
(11, 'field', 19, 1, ' facebook '),
(11, 'field', 20, 1, ' https www google com '),
(22, 'slug', 0, 1, ''),
(22, 'field', 4, 1, ' clients '),
(22, 'field', 5, 1, ' clients '),
(23, 'slug', 0, 1, ''),
(23, 'field', 4, 1, ' proposals '),
(23, 'field', 5, 1, ' proposals '),
(1, 'username', 0, 1, ' ideabase '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' info ideabasekent com '),
(1, 'slug', 0, 1, ''),
(26, 'slug', 0, 1, ' c client '),
(26, 'title', 0, 1, ' c client '),
(27, 'slug', 0, 1, ' d client '),
(27, 'title', 0, 1, ' d client '),
(28, 'slug', 0, 1, ' proposal 1 '),
(28, 'title', 0, 1, ' proposal 1 '),
(29, 'slug', 0, 1, ' proposal 2 '),
(29, 'title', 0, 1, ' proposal 2 '),
(30, 'slug', 0, 1, ' proposal 3 '),
(30, 'title', 0, 1, ' proposal 3 '),
(24, 'field', 26, 1, ' kent state university '),
(24, 'field', 27, 1, ' foobar not email foo bar other information goes here 330 123 4567 dr ph d chairman of nothing something else com something else 987 654 3210 mr iii director of stuff '),
(24, 'field', 35, 1, ' 138 e main st kent main address oh 44224 203 123 e main st kent other address oh 44224 '),
(31, 'field', 28, 1, ' dr '),
(31, 'field', 29, 1, ' foo '),
(31, 'field', 30, 1, ' bar '),
(31, 'field', 31, 1, ' ph d '),
(31, 'field', 32, 1, ' 330 123 4567 '),
(31, 'field', 33, 1, ' foobar not email '),
(31, 'field', 34, 1, ' other information goes here '),
(31, 'slug', 0, 1, ''),
(32, 'field', 28, 1, ' mr '),
(32, 'field', 29, 1, ' something '),
(32, 'field', 30, 1, ' else '),
(32, 'field', 31, 1, ' iii '),
(32, 'field', 32, 1, ' 987 654 3210 '),
(32, 'field', 33, 1, ' something else com '),
(32, 'field', 34, 1, ''),
(32, 'slug', 0, 1, ''),
(33, 'field', 36, 1, ' 138 e main st '),
(33, 'field', 37, 1, ' 203 '),
(33, 'field', 38, 1, ' kent '),
(33, 'field', 39, 1, ' oh '),
(33, 'field', 40, 1, ' 44224 '),
(33, 'field', 41, 1, ' main address '),
(33, 'slug', 0, 1, ''),
(31, 'field', 42, 1, ' chairman of nothing '),
(32, 'field', 42, 1, ' director of stuff '),
(34, 'field', 36, 1, ' 123 e main st '),
(34, 'field', 37, 1, ''),
(34, 'field', 38, 1, ' kent '),
(34, 'field', 39, 1, ' oh '),
(34, 'field', 40, 1, ' 44224 '),
(34, 'field', 41, 1, ' other address '),
(34, 'slug', 0, 1, ''),
(28, 'field', 43, 1, ' a client '),
(29, 'field', 43, 1, ''),
(30, 'field', 43, 1, ''),
(35, 'kind', 0, 1, ' image '),
(35, 'slug', 0, 1, ''),
(35, 'title', 0, 1, ' glyphix logo color 01 '),
(36, 'filename', 0, 1, ' ideabase_logo_horizontalcolor svg '),
(36, 'extension', 0, 1, ' svg '),
(36, 'kind', 0, 1, ' image '),
(36, 'slug', 0, 1, ''),
(36, 'title', 0, 1, ' ideabase logo horizontalcolor '),
(37, 'field', 44, 1, ' for more information or to discuss the proposal in detail please contact kristin dowling at 330 672 7366 or kdowling ideabasekent com to agree and initiate start of work please sign and fax to 330 672 7373 '),
(37, 'slug', 0, 1, ''),
(38, 'slug', 0, 1, ''),
(39, 'field', 44, 1, ' ideabase a research based design agency and is an initiative of kent state university a state institution of higher education in kent ohio ideabase is staffed primarily by kent state university students as an educational opportunity coordinated through the kent state university college of communication and information by signing below you are agreeing to and are legally bound by this proposal of engagement as well as by the attached terms and conditions '),
(39, 'slug', 0, 1, ''),
(38, 'field', 44, 1, ' working with ideabase ideabase is a kent state student powered design agency in downtown kent ohio our team represents a variety of backgrounds and disciplines united in our passion for creating meaningful solutions for our clients including dedicated account management when you sign with us you also get a dedicated account manager who takes care of weekly communications and meetings keeping your project on track and on budget a design focused team you ll benefit from a team of hand selected kent state students led by full time staff including a creative director professional user experience designer videographer photographer copywriters developers and visual designers a process centered around you our tried and true design process is custom tailored to meet your needs and keep you updated along the way producing a high quality design product that also meets the needs of your customers university powered expertise we have the backing of kent state giving you access to the talent and resources of one of ohio s largest universities while also providing life altering professional experiences to our students '),
(40, 'field', 44, 1, ' terms and conditions by accepting the proposal of engagement ideabase integrated marketing communications at kent state university ideabase and the client agree to the following costs these projected costs are preliminary and non binding and all work will be billed on a time and materials basis in accordance with our engagement letter and or our current rate schedule in creating this proposal we are relying on the current representations of client as to the extent of the scope of our engagement should the scope change we will submit a new proposal of engagement that reflects the changes to the scope and any subsequent changes to the hours and costs as work progresses at your request we will provide you with written updates on where the project stands against the scope and notify you in a timely manner if the hours will exceed the projected amount we will continue to work in good faith with your assurance of payment which you can signify by signing and returning this proposal or such subsequent proposal that may be submitted as work progresses if we do not receive payment or assurance of payment we reserve the right to cease working on this engagement when applicable ideabase will adjust any fees due by the client where ideabase believes in its sole discretion that such fees are due to unforeseen delay or other circumstances not based upon actions or omissions by the client intellectual property it is understood that any plans or ideas fully developed and or produced by the ideabase for you during the project including but not limited to layouts and storyboards become the exclusive intellectual property of client regardless of its incorporation into produced materials provided however any and all information presented to client in advance of receipt of compensation remains the property of ideabase and any use alteration and or modification of the property presented to client during this time is at its discretion either directly or indirectly except as specifically provided otherwise each party retains the rights and ownership of all intellectual property respectively owned by the parties prior to this engagement both parties also agreed that the methodology designed and utilized during the provision of services by ideabase is the exclusive property of ideabase and any intellectual property rights regarding the methodology and practices employed by ideabase under this agreement remain with the ideabase to the extent recognized by law client also grants to ideabase permission to use the work in self promotion for the agency as well as individual portfolio promotion for the employees unless provided otherwise ideabase warranties ideabase has the full rights to enter into this agreement and to perform its obligations hereunder and will comply with all applicable federal state and local laws ordinances and regulations ideabase represent and warrant to client that as of the effective date a we have the full right power and authority to enter into and fully perform our obligations according to the agreement and b we have not knowingly infringed upon the intellectual property rights of any third party or knowingly misappropriated the trade secrets of any third party in granting the software license to you client warranties client shall pay ideabase within 30 days of deliverables noted in the statement of work client hereby represents and warrants to ideabase that as of the effective date client has the full right power and authority to enter into and fully perform client s obligations according to this agreement the service offerings and products are provided as is ideabase makes no representations or warranties of any kind whether express implied statutory or otherwise regarding the service or products provided except to the extent prohibited by law ideabase disclaims all warranties including any implied warranties of merchantability satisfactory quality fitness for a particular purpose non infringement or quiet enjoyment and any warranties arising out of any course of dealing or usage of trade both parties further understand that these services are being provided in accordance with the university s educational mission to its students and staff and is not a professional service provider payment in consideration of the service provided client shall pay to the ideabase such fees as are provided for in the statement of work client understands that the specific terms of payment under this agreement and the statement of work are based upon timely payment within 30 days of the deliverable if client chooses to defer paying any amount beyond the date on which it is due client may be charged at the ideabase s discretion as additional consideration a late charge of 1% or the maximum permitted by law whichever is higher termination either party may terminate this agreement for cause upon written notice if the other party fails to cure any material breach of this agreement within thirty 30 days after receiving written notice of such breach or the other party ceases its business operations or becomes subject to insolvency proceedings and the proceedings are not dismissed within ninety days provided however that the period to cure a breach with respect to payment shall be ten 10 days nonpayment of any deliverable shall be considered a material breach liability to the extent permitted by ohio law each party agrees to be liable for the acts and omissions of its own officers employees and agents engaged in the scope of their employment arising under this agreement and each party hereby agrees to be responsible for any and all liability claims costs expenses or damages arising from any claim with respect to that party s role in connection with this agreement the parties agree that nothing in this provision shall be construed as a waiver of the sovereign immunity of university and or the state of ohio beyond the waiver provided in ohio revised code section 2743 02 in no event shall either party be liable to the other party for indirect consequential incidental special or punitive damages or lost profits taxes any sales tax use tax or other tax payable on production and delivery of media to client shall be the responsibility of client unless a valid tax exemption certificate is presented prior to invoicing assignment and obligation this agreement nor any statement of work may be assigned by either party without the written consent of the other party except as expressly provided herein neither party shall have the right to bind or obligate the other party in any manner without the other party s prior written consent agency nothing herein shall be construed to create an agency relationship between the ideabase and client or any employment relationship between ideabase and any staff member provided by client to perform the services under this agreement neither party will represent to be or hold itself out as an agent or affiliate of the other at any time during the term of this agreement use of logos trademarks etc neither party may use the other party s identifying marks without the express written permission of the other party use of a party s identifying marks without such permission will be considered a material breach of this agreement equal opportunity both parties subscribe to a policy of equal opportunity and will not discriminate on the basis of race gender religion national origin marital status sexual orientation or physical disability general terms any notice required or permitted by this agreement shall be sent by certified or registered mail return receipt requested and shall be deemed given upon receipt thereof all notices to client shall be addressed to ______________________________ ______________________________ ______________________________ attn ________________________ phone _______________________ email _______________________ all notices to ideabase shall be addressed to ideabase at kent state university 138 e main st suite 203 kent oh 44240 330 672 7366 the headings in this agreement have been inserted for convenient reference only and shall not be considered in any questions of interpretation or construction of this agreement if any section or provision of this agreement is held illegal unenforceable or in conflict with any law by a court of competent jurisdiction such section or provision of this agreement shall be deemed severed from this agreement and the validity of the remainder of this agreement shall not be affected thereby failure of either party to insist upon the performance of any provision hereof or to exercise any right or remedy shall not be deemed a waiver of any right or remedy or of any existing or subsequent breach or default this agreement and the rights of the parties hereunder shall be governed construed and interpreted in accordance with the laws of the state of ohio and only the ohio court of claims shall have jurisdiction over any action or proceeding concerning the agreement and or performance thereunder entire agreement this agreement contains the entire agreement between the parties hereto and shall not be modified amended or supplemented or any rights herein waived unless such amendment or modification to this agreement is i in writing ii refers to this agreement and iii executed by an authorized representative of each party this agreement supersedes any and all previous agreements whether written or oral between the parties in the event of a conflict between any subsequent statement of work and this agreement the terms of this agreement shall prevail '),
(40, 'slug', 0, 1, ''),
(41, 'field', 45, 1, ' ideabase logo horizontalcolor '),
(41, 'slug', 0, 1, ''),
(42, 'field', 45, 1, ' glyphix logo color 01 '),
(42, 'slug', 0, 1, ''),
(28, 'field', 46, 1, ' 1234project '),
(28, 'field', 47, 1, ' january 1 2076 '),
(29, 'field', 46, 1, ''),
(29, 'field', 47, 1, ''),
(30, 'field', 46, 1, ''),
(30, 'field', 47, 1, ''),
(28, 'field', 52, 1, ' 60 '),
(28, 'field', 48, 1, ' the kent historical society and museum brings educational programs to schools businesses and civic organizations as well as collaborates with community groups on projects such as the preservation of our historic pioneer cemetery the main street kent revitalization program and historic preservation projects in the community the society is dedicated to documenting kent history through artifacts records and documents from the people of the kent community the kent historical society and museum is seeking a website redesign in order to accomplish the following objectives a professional and visually appealing designorganized content with intuitive navigationbrand consistency on the web with other branded materialsthe ability for users to purchase books and photographs onlinecalendar of events '),
(28, 'field', 49, 1, ' branding and visual strategy ideabase will create branding and accompanying visual strategy for the kent historical society and museum ideabase will conduct a creative brief with the client in order to determine the objectives of the project and aid in the design after the creative brief ideabase will present 2 3 concepts for client approval once the final brand tagline and visual strategy are approved ideabase will integrate this visual strategy into the new website and provide the client with the files for future use across other media 40 website design ideabase will design and develop a custom website site design using a content management system cms ideabase will work with the client to choose a custom design the website will be populated with content photography and copy provided by the client using a content template provided by ideabase ideabase will share design elements layout and content for client approval throughout the design process the final site will also be approved by the client prior to handoff the website will utilize responsive design and will be viewable in all modern browsers internet explorer 11 and lower is not supported ideabase will provide timelines milestones and approval opportunities throughout the lifetime of the project 170 '),
(29, 'field', 52, 1, ''),
(29, 'field', 48, 1, ''),
(29, 'field', 49, 1, ''),
(30, 'field', 52, 1, ''),
(30, 'field', 48, 1, ''),
(30, 'field', 49, 1, ''),
(28, 'field', 53, 1, ' initial design end of february initial design end of february website end of april website end of april '),
(28, 'field', 54, 1, ' 10 '),
(29, 'field', 53, 1, ''),
(29, 'field', 54, 1, ''),
(30, 'field', 53, 1, ''),
(30, 'field', 54, 1, ''),
(42, 'field', 58, 1, ' glyphix logo '),
(41, 'field', 58, 1, ' ideabase logo '),
(41, 'field', 59, 1, ''),
(42, 'field', 59, 1, ''),
(28, 'field', 60, 1, ' glyphix '),
(28, 'field', 55, 1, ' domain name registration $15 year domain name registration $15 year hosting $25 month hosting $25 month cms fee $299 cms fee $299 '),
(28, 'field', 57, 1, ' bar '),
(28, 'field', 56, 1, ' foo '),
(29, 'field', 60, 1, ''),
(29, 'field', 55, 1, ''),
(29, 'field', 57, 1, ''),
(29, 'field', 56, 1, ''),
(30, 'field', 60, 1, ''),
(30, 'field', 55, 1, ''),
(30, 'field', 57, 1, ''),
(30, 'field', 56, 1, ''),
(43, 'field', 50, 1, ' branding and visual strategy ideabase will create branding and accompanying visual strategy for the kent historical society and museum ideabase will conduct a creative brief with the client in order to determine the objectives of the project and aid in the design after the creative brief ideabase will present 2 3 concepts for client approval once the final brand tagline and visual strategy are approved ideabase will integrate this visual strategy into the new website and provide the client with the files for future use across other media '),
(43, 'field', 51, 1, ' 40 '),
(43, 'slug', 0, 1, ''),
(44, 'field', 50, 1, ' website design ideabase will design and develop a custom website site design using a content management system cms ideabase will work with the client to choose a custom design the website will be populated with content photography and copy provided by the client using a content template provided by ideabase ideabase will share design elements layout and content for client approval throughout the design process the final site will also be approved by the client prior to handoff the website will utilize responsive design and will be viewable in all modern browsers internet explorer 11 and lower is not supported ideabase will provide timelines milestones and approval opportunities throughout the lifetime of the project '),
(44, 'field', 51, 1, ' 170 '),
(44, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Home', 'homepage', 'single', 1, 1, '2018-05-02 20:42:28', '2018-06-18 16:57:23', 'aac398bd-73a6-415d-ac5b-b04babbd68c5'),
(2, NULL, 'Proposals', 'proposals', 'channel', 1, 1, '2018-06-18 17:10:28', '2018-06-18 17:10:28', '2ff9ed29-fdce-482a-aa6c-e947310c7580');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_sites`
--

CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sections_sites`
--

INSERT INTO `craft_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'index', 1, '2018-05-02 20:42:28', '2018-06-18 16:57:23', 'decee477-7061-404c-a54e-e1100b3772c4'),
(2, 2, 1, 1, 'proposals/{slug}', 'proposals/_entry', 1, '2018-06-18 17:10:28', '2018-06-18 17:10:28', 'b4518905-9bfc-4e01-baec-1152e0d0ef07');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, '0ukFQpBmansTKYpkYdw1T1Sn3pm08zzn7vVsXLZXE8NvMtnjg77FH0j20wOVGrhyiM4CJ4Jed8ff_vDsqglRCSm2gZcWM-gn9ecv', '2018-05-09 20:47:12', '2018-05-09 20:56:20', 'f3d1ac2c-d2e7-492d-b26c-d17027ae6434'),
(3, 1, 'fy3kHstEivWfmCpM7Lr9O35ojki2zJP9WB2w-FbRkelNNy8a3l_RLV-BPgt9NXZ7SAdbPiU42AZy4A2mCwPe6MBwO3jO7ZxntbrU', '2018-06-18 19:38:10', '2018-06-18 20:19:45', 'a1c0092f-c8a6-4026-b83d-0cd502ea4b4a');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_sitegroups`
--

CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sitegroups`
--

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'IdeaBase Online Proposal System', '2018-05-02 20:31:26', '2018-06-18 17:16:28', '5f0f2a75-84ba-4564-8fdc-fe4b334a264f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sites`
--

CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sites`
--

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'IdeaBase Online Proposal System', 'default', 'en-US', 1, '@web/', 1, '2018-05-02 20:31:26', '2018-06-18 17:16:38', '8d38eac1-e5ec-4b1e-8816-dbec410c110d');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_structureelements`
--

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 10, 0, '2018-06-18 17:11:36', '2018-06-18 17:19:59', '739226b9-7082-411b-b61d-3f90775cb286'),
(2, 1, 24, 1, 2, 3, 1, '2018-06-18 17:11:36', '2018-06-18 17:11:36', 'd26f431e-a5ef-444b-8899-f2e4785887f5'),
(3, 1, 25, 1, 4, 5, 1, '2018-06-18 17:11:42', '2018-06-18 17:11:42', '7abec63b-fb79-45af-b76f-9fe127444d8e'),
(4, 1, 26, 1, 6, 7, 1, '2018-06-18 17:19:52', '2018-06-18 17:19:52', 'ac00f80a-5103-4e80-9432-05acf0e7d5fc'),
(5, 1, 27, 1, 8, 9, 1, '2018-06-18 17:19:59', '2018-06-18 17:19:59', 'bf35cfe8-10f9-4dc5-983a-f0f9a50c36f5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_structures`
--

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '2018-06-18 17:11:11', '2018-06-18 17:57:47', '95763e15-8473-4960-92d8-6f85aa0bfdba');

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemmessages`
--

CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemsettings`
--

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_systemsettings`
--

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{\"fromEmail\":\"info@ideabasekent.com\",\"fromName\":\"IdeaBase Online Proposal System\",\"template\":\"\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\",\"transportSettings\":null}', '2018-05-02 20:31:27', '2018-06-18 17:17:01', '7779fb43-cfee-4cc5-94e2-cd44081bf036');

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachequeries`
--

CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpreferences`
--

CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_userpreferences`
--

INSERT INTO `craft_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\",\"weekStartDay\":\"0\",\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ideabase', NULL, '', '', 'info@ideabasekent.com', '$2y$13$GH24bDZSwZlI.GZdNbvP9.fveID0MqTeoHSkaC11s9zU6OcZUfpuG', 1, 0, 0, 0, '2018-06-18 19:38:10', '::1', NULL, NULL, '2018-06-18 19:37:58', NULL, 1, NULL, NULL, NULL, 0, '2018-06-18 19:38:34', '2018-05-02 20:31:27', '2018-06-18 19:38:34', '36ed8153-4670-400d-8540-d2f926079c0e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumefolders`
--

CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_volumefolders`
--

INSERT INTO `craft_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Assets', '', '2018-05-07 19:45:09', '2018-05-07 19:45:09', '919ceac1-f7ec-42d4-9d53-bd08636acb0d'),
(2, NULL, NULL, 'Temporary source', NULL, '2018-05-07 19:45:44', '2018-05-07 19:45:44', '8d8a4731-8c76-47c7-ae0a-50c63527502b'),
(3, 2, NULL, 'user_1', 'user_1/', '2018-05-07 19:45:44', '2018-05-07 19:45:44', '610ec81c-b724-4c93-b951-a5d5f13e861f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumes`
--

CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_volumes`
--

INSERT INTO `craft_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 9, 'Assets', 'assets', 'craft\\volumes\\Local', 1, '@baseUrl/assets/img/uploads', '{\"path\":\"assets/img/uploads/\"}', 1, '2018-05-07 19:45:09', '2018-05-09 19:25:10', '0f18705a-a007-42c9-ab24-1dee9a7d2c8e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, 0, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', '38cc3888-b2dc-4b5e-9d96-3c62ea59ae10'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, 0, '[]', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', 'c4573e93-ab40-4276-bf0a-7725de48a741'),
(3, 1, 'craft\\widgets\\Updates', 3, 0, '[]', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', '138c2926-45e7-4cb4-a9ff-11ed28a77e79'),
(4, 1, 'craft\\widgets\\Feed', 4, 0, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', '988ebc79-a54f-4308-ba88-0b4644bd3f96');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `craft_assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `craft_assets_folderId_idx` (`folderId`),
  ADD KEY `craft_assets_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_categories_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_categorygroups_structureId_idx` (`structureId`),
  ADD KEY `craft_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `craft_categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_content_siteId_idx` (`siteId`),
  ADD KEY `craft_content_title_idx` (`title`);

--
-- Indexes for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `craft_elements_type_idx` (`type`),
  ADD KEY `craft_elements_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD UNIQUE KEY `craft_elements_sites_uri_siteId_unq_idx` (`uri`,`siteId`),
  ADD KEY `craft_elements_sites_siteId_idx` (`siteId`),
  ADD KEY `craft_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `craft_elements_sites_enabled_idx` (`enabled`);

--
-- Indexes for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entries_postDate_idx` (`postDate`),
  ADD KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `craft_entries_authorId_idx` (`authorId`),
  ADD KEY `craft_entries_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entries_typeId_idx` (`typeId`);

--
-- Indexes for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `craft_entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `craft_entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indexes for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  ADD UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  ADD KEY `craft_entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `craft_entryversions_siteId_idx` (`siteId`),
  ADD KEY `craft_entryversions_creatorId_idx` (`creatorId`);

--
-- Indexes for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `craft_fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `craft_fields_groupId_idx` (`groupId`),
  ADD KEY `craft_fields_context_idx` (`context`);

--
-- Indexes for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  ADD KEY `craft_globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_info`
--
ALTER TABLE `craft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_matrixblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indexes for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_matrixcontent_addresses`
--
ALTER TABLE `craft_matrixcontent_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_addresses_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_matrixcontent_addresses_siteId_fk` (`siteId`);

--
-- Indexes for table `craft_matrixcontent_contacts`
--
ALTER TABLE `craft_matrixcontent_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_contacts_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_matrixcontent_contacts_siteId_fk` (`siteId`);

--
-- Indexes for table `craft_matrixcontent_elements`
--
ALTER TABLE `craft_matrixcontent_elements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_elements_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_matrixcontent_elements_siteId_fk` (`siteId`);

--
-- Indexes for table `craft_matrixcontent_pagecontent`
--
ALTER TABLE `craft_matrixcontent_pagecontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_pagecontent_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_matrixcontent_pagecontent_siteId_fk` (`siteId`);

--
-- Indexes for table `craft_matrixcontent_socialmatrix`
--
ALTER TABLE `craft_matrixcontent_socialmatrix`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_socialmatrix_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_matrixcontent_socialmatrix_siteId_fk` (`siteId`);

--
-- Indexes for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_migrations_pluginId_idx` (`pluginId`),
  ADD KEY `craft_migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_plugins_handle_unq_idx` (`handle`),
  ADD KEY `craft_plugins_enabled_idx` (`enabled`);

--
-- Indexes for table `craft_queue`
--
ALTER TABLE `craft_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `craft_queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `craft_relations_sourceId_idx` (`sourceId`),
  ADD KEY `craft_relations_targetId_idx` (`targetId`),
  ADD KEY `craft_relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `craft_resourcepaths`
--
ALTER TABLE `craft_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_routes_uriPattern_idx` (`uriPattern`),
  ADD KEY `craft_routes_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_searchindex`
--
ALTER TABLE `craft_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `craft_searchindex` ADD FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  ADD KEY `craft_sections_structureId_idx` (`structureId`);

--
-- Indexes for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `craft_sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sessions_uid_idx` (`uid`),
  ADD KEY `craft_sessions_token_idx` (`token`),
  ADD KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `craft_sessions_userId_idx` (`userId`);

--
-- Indexes for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sitegroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sites_handle_unq_idx` (`handle`),
  ADD KEY `craft_sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_sites_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `craft_structureelements_root_idx` (`root`),
  ADD KEY `craft_structureelements_lft_idx` (`lft`),
  ADD KEY `craft_structureelements_rgt_idx` (`rgt`),
  ADD KEY `craft_structureelements_level_idx` (`level`),
  ADD KEY `craft_structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `craft_structures`
--
ALTER TABLE `craft_structures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `craft_systemmessages_language_idx` (`language`);

--
-- Indexes for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`);

--
-- Indexes for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_tags_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD KEY `craft_templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `craft_templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `craft_templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `craft_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `craft_templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  ADD KEY `craft_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `craft_usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `craft_userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `craft_userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  ADD UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  ADD KEY `craft_users_uid_idx` (`uid`),
  ADD KEY `craft_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `craft_users_photoId_fk` (`photoId`);

--
-- Indexes for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `craft_volumefolders_parentId_idx` (`parentId`),
  ADD KEY `craft_volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_volumes_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_volumes_handle_unq_idx` (`handle`),
  ADD KEY `craft_volumes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_content`
--
ALTER TABLE `craft_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_elements`
--
ALTER TABLE `craft_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `craft_fields`
--
ALTER TABLE `craft_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `craft_info`
--
ALTER TABLE `craft_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `craft_matrixcontent_addresses`
--
ALTER TABLE `craft_matrixcontent_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `craft_matrixcontent_contacts`
--
ALTER TABLE `craft_matrixcontent_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `craft_matrixcontent_elements`
--
ALTER TABLE `craft_matrixcontent_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `craft_matrixcontent_pagecontent`
--
ALTER TABLE `craft_matrixcontent_pagecontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `craft_matrixcontent_socialmatrix`
--
ALTER TABLE `craft_matrixcontent_socialmatrix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_queue`
--
ALTER TABLE `craft_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_relations`
--
ALTER TABLE `craft_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `craft_routes`
--
ALTER TABLE `craft_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_sections`
--
ALTER TABLE `craft_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_sites`
--
ALTER TABLE `craft_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_structures`
--
ALTER TABLE `craft_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD CONSTRAINT `craft_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD CONSTRAINT `craft_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD CONSTRAINT `craft_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD CONSTRAINT `craft_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD CONSTRAINT `craft_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixcontent_addresses`
--
ALTER TABLE `craft_matrixcontent_addresses`
  ADD CONSTRAINT `craft_matrixcontent_addresses_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_addresses_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_contacts`
--
ALTER TABLE `craft_matrixcontent_contacts`
  ADD CONSTRAINT `craft_matrixcontent_contacts_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_contacts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_elements`
--
ALTER TABLE `craft_matrixcontent_elements`
  ADD CONSTRAINT `craft_matrixcontent_elements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_elements_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_pagecontent`
--
ALTER TABLE `craft_matrixcontent_pagecontent`
  ADD CONSTRAINT `craft_matrixcontent_pagecontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_pagecontent_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_socialmatrix`
--
ALTER TABLE `craft_matrixcontent_socialmatrix`
  ADD CONSTRAINT `craft_matrixcontent_socialmatrix_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_socialmatrix_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD CONSTRAINT `craft_routes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD CONSTRAINT `craft_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD CONSTRAINT `craft_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD CONSTRAINT `craft_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD CONSTRAINT `craft_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD CONSTRAINT `craft_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD CONSTRAINT `craft_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
