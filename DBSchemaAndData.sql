USE KainosJob_PatrykK;

CREATE TABLE User(
    user_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(20) NOT NULL,
    `role` ENUM('Employee', 'Admin') NOT NULL,
    token VARCHAR(200) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    `location` ENUM('Belfast', 'Gdansk', 'Birmingham', 'London')
);

CREATE TABLE Capability(
    cap_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    cap_name VARCHAR(50) NOT NULL
);

CREATE TABLE Job_Roles(
    role_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL,
    role_description VARCHAR(1500) NOT NULL,
    sharepoint_url VARCHAR(1000) NOT NULL,
    cap_id SMALLINT,
    band_id INT,
    FOREIGN KEY (cap_id) REFERENCES Capability(cap_id),
    FOREIGN KEY (band_id) REFERENCES Band(band_id)
);

CREATE TABLE Competency( 
   comp_id varchar(50) PRIMARY KEY, 
   apprentice VARCHAR(2000)  NOT NULL, 
   trainee VARCHAR(2000)  NOT NULL, 
   associate VARCHAR(2000)  NOT NULL, 
   senior_associate VARCHAR(2000)  NOT NULL, 
   consultant VARCHAR(2000)  NOT NULL, 
   manager VARCHAR(2000) NOT NULL, 
   principal VARCHAR(2000) NOT NULL
);

CREATE TABLE Band( 
   band_id INT PRIMARY KEY, 
   band_name VARCHAR(50) NOT NULL
);

CREATE TABLE Training( 
   training_id INT PRIMARY KEY, 
   training VARCHAR(50) NOT NULL,
   sharepoint_url VARCHAR(1000) NOT NULL
);

 CREATE TABLE Training_Bands( 
   training_id INT, 
   band_id INT,
   FOREIGN KEY (training_id) REFERENCES Training(training_id),
   FOREIGN KEY (band_id) REFERENCES Band(band_id)
);

# Data Analytics
CREATE TABLE IF NOT EXISTS Employee_Fact (
    `BusinessEntityID` INT,
    `NationalIDNumber` INT,
    `Band_level` INT,
    `Kainos_Job_title` VARCHAR(33) CHARACTER SET utf8,
    `Job_family` VARCHAR(29) CHARACTER SET utf8,
    `Capability` VARCHAR(12) CHARACTER SET utf8,
    `BirthDate` DATETIME,
    `MaritalStatus` VARCHAR(1) CHARACTER SET utf8,
    `Gender` VARCHAR(1) CHARACTER SET utf8,
    `HireDate` DATETIME,
    `VacationHours` INT,
    `SickLeaveHours` INT,
    `CurrentFlag` INT,
    `rowguid` VARCHAR(36) CHARACTER SET utf8,
    `ModifiedDate` VARCHAR(26) CHARACTER SET utf8,
    `BusinessEntityID_1` INT,
    `Salary_GBP` NUMERIC(9, 3),
    `Location` VARCHAR(11) CHARACTER SET utf8
);

INSERT INTO
Capability (cap_name) 
VALUES
('Engineering'),
('Platforms'),
('Data'),
('Artificial Intelligence'),
('Cyber Security'), 
('Workday'),
('Experience Design'),
('Product'),
('Delivery'),
('Operations'),
('Business Development and Marketing'),
('Organisational Strategy and Planning'),
('People'),
('Commercial and Financial Management'),
('Business Services Support');



# insert job roles


INSERT INTO
Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id)
VALUES
('Innovation Lead',
 'As an Innovation Lead (Consultant) in Kainos, youll be responsible will lead the team, working with the Innovation Lead in a dynamic and hands-on role which will involve managing and developing the team, implementing and shaping Kainos innovation strategy and effectively communicating the exciting work we undertake both internally and within the wider technology community.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Innovation%20Lead%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
  1, 4),
('Lead Software Engineer',
 'As a Lead Software Engineer (Consultant) in Kainos, you’ll be responsible for leading teams and developing high quality solutions which delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20Software%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
  1, 4),
('Lead NFTEngineer',
 'As a Lead NFTEngineer(Consultant)in Kainos, youll be a technical leader and innovator in Non-Functional Testing, providing strong test leadership and direction within a multi-skilled agile team. Taking responsibility for the strategy, design and development of non-functional requirements & tests, youll help the team to deliver working application software that is scalable and performant for theusers. Its a fast-paced environment so it is important for you to make sound, reasoned decisions.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20NFT%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
  1, 4),
('Technical Architect',
 'As a Technical Architect (Consultant) in Kainos, you’ll be responsible for leading teams and developing high quality solutions which delight our customers and impact the lives of users worldwide. As a technical leader on a project, you’ll work with customer architects to agree technical designs, advising on estimated effort and technical implications of user stories and user journeys.',
  'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspid=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Technical%20Architect%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
   1, 4),
('Senior People Support Associate',
 'As a Senior People Support Associate at Kainos, you will provide an excellent service across all Business Units in Kainos globally. You will be responsible for offering advice and guidance to employees on all People related matters, ensuring legislative guidance is adhered to and high standards are met and maintained in all people related processes. You will also be a key player in supporting the delivery of the People Strategy.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FPeople%2FPeople%20Support%2FJob%20profile%20%2D%20Senior%20People%20Support%20Associate%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FPeople%2FPeople%20Support&p=true&ga=1',
 13, 5),
('Talent Acquisition Specialist',
 'The Talent Acquisition team at Kainos are responsible for end to end delivery aligned to BU hiring demands. Based in locations across UK &I, Europe and North America, the team focus on direct sourcing channels to create a best in class candidate experience, in the most cost-effective way',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FPeople%2FTalent%20Acquisition%2FJob%20profile%20%2D%20Talent%20Acquisition%20Specialist%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FPeople%2FTalent%20Acquisition&p=true&ga=1',
  13, 6),
('Service Delivery Manager',
 'As a Service Delivery Manager in Kainos, you will assist in the direction and management of Support. Manages and champions assigned areas of ownership across assigned clients and within Kainos as a whole. Responsible for managing the delivery of a support service, and managing the client-relationship, across projects. Works with Clients and the Sales team to drive out new opportunities and expand Kainos footprint within our account.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FDelivery%2FJob%20profile%20%2D%20Service%20Delivery%20Management%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FDelivery&p=true&ga=1',
  9, 3),

('Workday Integrations Consultant',
 'As a Workday Integrations Consultant (Trainee) in Kainos, you will be responsible for supporting the successful specification, design and configuration of enterprise-scale Workday product solutions. This will be done by working with internal delivery teams to provide solutions that are fit for purpose and commercially viable. Understanding and translating customer requirements, as well as hands-on product configuration is essential for this role.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FIntegrations%2FJob%20Profile%20%2D%20Integrations%20Consultant%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FIntegrations&p=true&ga=1',
 6, 7);

INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id)
   VALUES ('Data Engineer', 
   'As a Data Engineer (Associate) in Kainos you will work within a multi-skilled agile team to design and develop large-scale data processing software to meet user needs in demanding production environments.  ', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Engineer%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 6),
   ('Trainee Data Engineer', 
   'As a Trainee Data Engineer (Trainee) in Kainos you will enter the Kainos Big Data Academy. Successful graduates of the Big Data Academy will become Associate Data Engineers, following a period of extended project-based training.  ', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Trainee%20Data%20Engineer%20%28T%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 7),
   ('Data Analyst', 
   'As a Data Analyst (Associate) in Kainos, you’ll be responsible for matching the needs of data insight with understanding of the available data. Data analysts work closely with customers to produce insight products including reports, dashboards and visualisations but also contribute to project understanding of existing data structures so that inputs and outputs are fully understood.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Analyst%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 6),
   ('Senior Data Engineer', 
   'As a Senior Data Engineer (Senior Associate) at Kainos, you will be responsible or designing and developing data processing and data persistence software components for solutions which handle data at scale. Working in agile teams, Senior Data Engineers provide strong development leadership and take responsibility for significant technical components of data systems . You will work within a multi-skilled agile team to design and develop large-scale data processing software to meet user needs in demanding production environments.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Senior%20Data%20Engineer%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 5),
   ('Senior Data Analyst', 
   'As a Senior Data Analyst (Senior Associate) at Kainos, you’ll be responsible for matching the needs of data insight with understanding of the available data. Data analysts work closely with customers to produce insight products including reports, dashboards and visualisations but also contribute to project understanding of existing data structures so that inputs and outputs are fully understood. It therefore has a strong consulting element.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Senior%20Data%20Analyst%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 5),
   ('Principal Data Solution Architect', 
   'As a Principal Data Solution Architect in Kainos, you’ll be accountable for successful delivery of contemporary data solutions across multiple customers.  You’ll have gravitas within the data community and strong thought leadership, working with senior stakeholders to agree principles, strategic direction and functional and non-functional designs. You will manage other architects and engineers in the capability to help them navigate their careers.  ', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Principal%20Data%20Solution%20Architect%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 2),
   ('Principal Data Architect', 
   'As a Principal Data Architect in Kainos, you’ll be accountable for successful delivery of data solutions across multiple customers; taking responsibility across traditional data architecture disciplines around data structures, data flows, data sourcing and data governance.  This will mean working at a solution and enterprise level.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Principal%20Data%20Architect%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 2),
   ('Data Solution Architect', 
   'As a Data Solution Architect (Manager) in Kainos, you’ll be responsible for a multi- skilled agile teams to design and deliver contemporary data solutions. You will be a quality orientated pragmatist, where you balance trade-offs to successfully deliver complex solutions. You will be viewed as an authority figure for data technology solutions, providing strong technical and thought leadership.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Solution%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 3),
   ('Data Architect', 
   'As a Data Architect (Manager) in Kainos, you’ll be responsible for providing SME guidance in traditional data architecture disciplines around data structures, data flows, data sourcing and data governance. Data Architects work closely with clients to understand their data requirements and take responsibility for ensuring solutions are fit for purpose. They also provide technical leadership for the rest of the team in the area of data.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 3),
   ('Data Consultant', 
   'As a Data Consultant(Manager) in Kainos, you will combinethought leadership, delivery and commercial experience to identify, securenew business aswe help customers on their digital transformation journeys which have vital data considerationswhere value can be unlocked.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20Profile%20%2D%20Data%20Consultant%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 3),
   ('Lead Data Analyst', 
   'As a Lead Data Analyst(Consultant)in Kainos, you’ll workwithin a multi-skilled agile team to collect and analyse data and enable insight tosenior customers that drives business improvement.', 
   'https://kainossoftwareltd.sharepoint.com/sites/PeopleTeam-SharedDrive/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FData%2FJob%20profile%20%2D%20Lead%20Data%20Analyst%20%28C%29%2Epdf&parent=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FData&p=true&ga=1', 
   3, 4),
   ('Data Technical Architect', 
   'As a Data Technical Architect (Consultant) in Kainos, you will be responsible for designing and delivering technical components as part of a larger data solution. You will work closely with Solution Architects and Customer Architects to integrate these components into quality data solutions', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Technical%20Architect%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3, 4);

   #AI capability - 4
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Trainee AI Engineer', 'As a Trainee Artificial Intelligence (AI) Engineer in Kainos, you’ll be responsible for contributing to the development of high-quality solutions which integrate AI and ML technologies that delight our customers and impact the lives of users worldwide. You’ll do this whilst gaining awareness and learning about new AI technologies, frameworks and approaches, with talented colleagues that will help you to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Trainee%20AI%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4, 7);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Associate Data Scientist', 'As  an  Associate  Data  Scientist  in  Kainos,  you’ll  be  responsible  for  developing  high  quality  solutions that use AI and ML technologies to delight our customers and impact the lives of users  worldwide.  It’s  a  fast-paced  environment  so  it  is  important  for  you  to  make  sound,  reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Associate%20Data%20Scientist%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4, 6);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Senior AI Engineer', 'As a   Senior Artificial Intelligence (AI) Engineer in Kainos, you’ll be responsible for developing high  quality  solutions  that  use  AI  and  ML  technologies  which  delight  our  customers  and  impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow as you, in turn, mentor those around you.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Senior%20AI%20Engineer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4, 5);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Consultant Data Scientist', 'As a Consultant Data Scientist in Kainos, you’ll be responsible for leading teams and developing high quality solutions that use AI and ML technologies to delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow. As the technical leader in the team, you will also interact with customers, share knowledge and mentor those around you.You will manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Consultant%20Data%20Scientist%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4, 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('AI Engineering Manager', 'As an Artificial Intelligence (AI) Engineer Manager in Kainos, you’ll be responsible for successful delivery of large-scale high-quality solutions that use AI and ML technologiesthat delight our customers and impact the lives of users worldwide.  You will provide leadership and support to AI engineering teams by understanding the outcomes the solution is trying to achieve, the engineering implications and complexity surrounding you and your teams designs and helping teams make the right decisions.  You’ll work with senior stakeholders to agree architectural principles, strategic direction and functional and non-functional designs.  As a technical leader, you will work with your colleagues to inform development of policy and standards, develop customer relationships, account management and share knowledge and mentor those around you. You’ll do this whilst advising about new technologies and approaches to AI/ML, with room to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20AI%20Engineering%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4, 3);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Principal Data Scientist', 'As a Principal Data Scientist in Kainos, you’ll be accountable for successful delivery of large-scale high-quality solutions that use AI and ML technologies that delight our customers and impact the lives of users worldwide.  You  will  provide  assurance  and  support  to  multi-skilled  agile  teams  by  understanding  the  outcomes   the   solution   is   trying   to   achieve,   the   data   implications   and   complexity   surrounding you and your teams designs and helping teams make the right decisions.  You’ll work with senior stakeholders to agree architectural principles, strategic direction and functional and non-functional designs. You will proactively develop new alliances with other vendors that will provide Kainos with new capability.  As  a  technical  leader,  you  will  work  with  your  colleagues  to  lead  development  of  policy  and  standards,  develop  customer  relationships,  develop  account  strategies  and  share  knowledge  and  mentor  those  around  you.  You’ll  do  this  whilst  advising  about  new  technologies and approaches to data, with room to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Principal%20Data%20Scientist%20%28Principal%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4, 2);

#Operations capability - 10
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Programme Office Assistant', 'As a Programme Office Assistant(Trainee) at Kainos, you’ll be responsible for ensuring that a high-quality service is provided to the Project Management and Operations capabilities within the Digital Services/Workday/Central Servicesbusiness unit, demonstrating best practice throughout. You will provide administrative support for our engagements and will have a key role in the efficient management and delivery of these projects.You’ll work as part of the Digital Services/Workday/Central ServicesOperations PMO team and report into the Operations Manager. It’s a fast-paced environment so it is important for you to ensure that workload is prioritised, and tasks completed in a timely manner.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Programme%20Office%20Assistant%20%28T%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1', 10, 7);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Staffing Consultant', 'As a Staffing Consultant (Senior Associate) at Kainos, you will be responsible for the day-to-day  staffing  of  projects  within  a  Business  unit.  You will ensure the  talent  pool  has  the  appropriate skills for forecasted projects while maximising profitable utilisation. You will also be responsible for ensuring the accurate closure of month end accounts.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Staffing%20Consultant%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1', 10, 5);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Operations Manager', 'As an Operations Manager (Manager) at Kainos, you will be responsible managing and improving the day to day operational processes within the Business Unit (BU) which supports  the management team and wider BU including sales, revenue and staff forecasting, staff allocation and recruitment forecasting, month-end closure, profitabilityand working capital.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Operations%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1', 10, 3);

#Business Development and Marketing - 11
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Marketing Assistant', 'Our vision is to create a world-class business development and marketing capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we continue our growth trajectory.We do this via an open and supportive environment where colleagues can share information, learn from one another, and excel in their own career.  With consistent ways of working aligned to industry best practice, we buildsustainable and predictable sales pipelines for our market-leading offerings.As a Marketing AssistantatKainos,we will support you to build your career in marketing. You will gain a solid grounding in many aspects ofmarketing, branding and communications.You will work as part of a team creatingand delivering the marketing campaignsand activitiesthatare aligned to commercial needsand designed to drive brand awareness/support recruitment/generate leads to fuel the sales pipeline.This will include competitor research, supporting content creationand aspects of activation, digital and social media marketing, reporting and evaluation, and undertaking defined projects to support delivery against plan.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Business%2FJob%20profile%20%2D%20Marketing%20Assistant%20%28T%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Business&p=true&ga=1', 11, 7);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Customer Success Manager', 'Our vision is to create a world-class Customer Success capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we retain clients and expand our footprint within existing clients to continue our growth trajectory.We do this via an open and supportive environment where colleagues can share information, learn from one another and excel in their own career.  With consistent ways of working aligned to industry best practice, we retain and grow our footprint by delivering on the clients desired outcomes for our market-leading offerings.As a Customer Success Manager (Consultant) at Kainos, you will partner with our customers post-sale to drive adoption and ensure customer satisfaction, growth, and retention. You will be the bridge between our Professional Services, Operational Support and Business Development teams. You will work directly with customers to ensure that their overall user experience with Kainos Smart is a success.We are looking for an individual who strike the right mix of sales, account management, domain knowledge and customer management skills.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FClient%20Management%2FJob%20Profile%20%2D%20Customer%20Success%20Manger%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FClient%20Management&p=true&ga=1', 11, 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Digital Strategy Director', 'Our vision is to create a world-class business development and marketing capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we continue our growth trajectory.We do this via an open and supportive environment where colleagues can share information, learn from one another, and excel in their own career.  With consistent ways of working aligned to industry best practice, we build sustainable and predictable sales pipelines for our market-leading offerings.As the Digital Strategy Director(Principal) atKainos, you willbe responsible globally the company’sdigital strategyand the tech stack(including ownership of our website platform), Marketo marketing automation (injecting great practice into our team to drive lead generation) and marketing operationsacross the world (ensuring marketing is transparent, consistent in approachand accountable viaROI reporting).You will use your extensive digital experience and commercial knowledge to lead and mentor themartech & Ops team whoact as a Digital Centre of Excellence tomarketing colleagues oncampaigns togenerate leads. You will foster strong relationships with key internal stakeholders and external partners acting as a trusted advisor.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Martech%20and%20Ops%2FJob%20profile%20%2D%20Digital%20Strategy%20Director%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Martech%20and%20Ops&p=true&ga=1', 11, 2);

#Organisational Strategy and Planning - 12
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('BU Chief Operating Officer', 'The Business Unit COOplays a strategic role in supportingthe deliveryof the business goals andstrategic ambitions–to be a great employer, to delight our customers and to be a growing, profitable and responsible company.  As an Executive in Kainos you will have an established track record in business planning, creating and operationalizing commercial and operational strategiesfor the business unit.As a member of the ExecutiveTeam,you will supportallour sustainability programmes and take personal responsibilityforone programme.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning%2FJob%20profile%20%2D%20BU%20COO%20%28Executive%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning&p=true&ga=1', 12, 1);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Region/Sector Lead', 'As aRegion/Sector Lead (Leader) at Kainos,you will be accountable for sales, proposition development, customer relationships, overseeing project delivery and the Customer/Partnershiprelationship within the region/sector.This role sits within the Digital Services/WorkdayBUleadership team with accountability for sales performance, customer relationships, overseeing project delivery and Workday / sectorrelationship within a defined region. The Region/Sector Leadwill be responsible for leading sales and customer engagement teams to deliver the Sales Order Value and Customer Initiatives set out in the business plan. The Region/Sector Leadand their team will work closely with the BU Chief Operating Officer to accurately forecast demand, increase margin, develop propositions, and manage customer escalations.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning%2FJob%20profile%20-%20Region_Sector%20Lead%20%28Leader%29.pdf&parent=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning&p=true&ga=1', 12, 1);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Head of Practice', 'As a Head of Practice (Manger) at Kainos, you will define and lead the strategy for the Practice. You will define the go to market offerings and commercial proposition for the Practice. You will also evolve the Practice to take advantage of Partner advancements and market changes. You will educate and motivate the sales Business Development function to deliver the SOV targets for the Practice. You will champion the growth of people and their capabilities to support the Practice in line with Kainos culture and values.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning%2FJob%20profile%20%2D%20Head%20of%20Practice%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning&p=true&ga=1', 12, 3);

INSERT INTO Job_Roles( role_name, role_description,sharepoint_url,cap_id, band_id)
VALUES('Software Engineer','As a Software Engineer (Associate) in Kainos, you will be responsible for developing high quality solutions which delight our customers and impact the lives of users worldwide. You will do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.','https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1, 6);

INSERT INTO Job_Roles( role_name, role_description,sharepoint_url,cap_id, band_id)
VALUES('Front-End Engineer','As a Front-end Engineer in Kainos, you will have the opportunity to use your expertise in developing high quality user interface solutions which delight our customers and impact the lives of users worldwide.   The projects you will join are varied, and often highly visible. You will be working in fast-paced, agile environments, so it is important for you to make sound, reasoned decisions, and recommendations on front-end and user interfaces with your colleagues. You are determined, flexible and always constructive; proactive in improving things and are always inclusive and respectful in your interactions with your team. You will be working alongside talented, diverse, enthusiastic colleagues, who will help you learn and develop as you, in turn, mentor those around you.', 'https://kainossoftwareltd.sharepoint.com/sites/PeopleTeam-SharedDrive/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering%2FJob%20Profile%20%2D%20Senior%20Front%2DEnd%20Engineer%20%28SA%29%2Epdf&parent=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering&p=true&ga=1',1, 6);

INSERT INTO Job_Roles( role_name, role_description,sharepoint_url,cap_id, band_id)
VALUES('Support Technician','As a Support Technician (Associate) in Kainos, you will be responsible for analysing and solving complicated technical issues.  You will adhere to ITIL standards and will participate fully in the Incident management lifecycle.   You will work closely with clients, internal teams and 3rd Party vendors to ensure that problems are resolved. You will do this whilst learning about new approaches, with talented colleagues that will help you to learn, develop and grow.','https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Support%20Technician%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering',1, 6);

INSERT INTO Job_Roles( role_name, role_description, sharepoint_url, cap_id, band_id)
VALUES('Test Engineer','As a Test Engineer (Associate) in Kainos, you will work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs. You will do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Test%20Engineer%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting&p=true&ga=1', 1, 6);

INSERT INTO Job_Roles( role_name, role_description, sharepoint_url, cap_id, band_id)
VALUES('Product Specialist','As a Product Specialist at Kainos you will be responsible for delivering high quality solutions which delight our customers and impact the lives of users worldwide. It is a fast paced environment so it is important for you to make sound, reasoned decisions. You will do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.You will be responsible for capturing and mapping customer needs to product capabilities, supporting clients throughout their implementation lifecycle and business processes changes as well as providing information to relevant engineering teams on improvements or fixes required in the products.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Product%20Specialist%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',1, 6);

INSERT INTO Job_Roles( role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Trainee Software Engineer','As a Trainee Software Engineer with Kainos, you will work on projects where you can make a real difference to people’s lives – the lives of people you know. After taking part in our award-winning, seven-week Engineering Academy, you will then join one of our many project teams, to learn from our experienced developers, project managers and customer-facing staff. You’ll have great support and mentoring, balanced with the experience of being given real, meaningful work to do, to help you truly develop both technically and professionally.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1, 7);  

INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Trainee Test Engineer', 'As a Test Engineer (Trainee) in Kainos, you’ll work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs. You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Trainee%20Test%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting&p=true&ga=1', 1, 7);

INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES ('Apprentice Software Engineer', 'Our highly-regarded scheme gives the opportunity to work for us as an Apprentice Software Engineer four days per week, while studying for a part time degree in Computing Systems one day per week, with Ulster University, Jordanstown, completing your degree in just four and a half years.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Apprentice%20Software%20Engineer%20%28Apprentice%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1, 8);
   
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Principal Architect', 'As an Innovation Lead (Consultant) in Kainos, youll be responsible will lead the team, working with the Innovation Lead in a dynamic and hands-on role which will involve managing and developing the team, implementing and shaping Kainos innovation strategy and effectively communicating the exciting work we undertake both internally and within the wider technology community.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Principal%20Architect%20%28Principal%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1, 2);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Test Architect', 'As a Test Architect (Manager) in Kainos, you’ll be responsible for ensuring we deliver high quality solutions which delight our customers and impact the lives of users worldwide.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Test%20Architect%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting&p=true&ga=1', 1, 3);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Solution Architect', 'As a Solution Architect (Manager) in Kainos, you’ll be responsible for leading multi-skilled agile teams to design and deliver high quality solutions which delight our customers and impact the lives of users worldwide.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Solution%20Architect%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1, 3);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Lead Test Engineer', 'As a Lead Test Engineer (Consultant) in Kainos, you’ll be a technical leader and innovator in software testing, providing strong test leadership and direction within a multi-skilled agile team.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Lead%20Test%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting&p=true&ga=1', 1, 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Senior Software Engineer', 'As a Senior Software Engineer (Senior Associate) in Kainos, you’ll be responsible for developing high quality solutions which delight our customers and impact the lives of users worldwide.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Senior%20Software%20Engieneer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1, 5);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Senior Test Engineer', 'As a Senior Test Engineer (Senior Associate) in Kainos, you’ll work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Senior%20Test%20Engineer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting', 1, 5);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id) 
VALUES('Lead Data Engineer', 'As a Data Engineer (Associate) in Kainos you will work within a multi-skilled agile team to design and develop large-scale data processing software to meet user needs in demanding production environments.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Lead%20Data%20Engineer%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData', 3, 6);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id, band_id)  
VALUES('Trainee Data Analyst', 'As a Trainee Data Analyst (Trainee) in Kainos you will enter the Kainos Big Data Academy. Successful graduates of the Big Data Academy will become Associate Data Analysts, following a period of extended project-based training.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Trainee%20Data%20Engineer%20%28T%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData', 3, 7);  
   
# populate band table
   
INSERT INTO Band (band_id, band_name)
   VALUES (1, 
   'Leaders'),
   (2, 
   'Principal'),
   (3, 
   'Manager'),
   (4, 
   'Consultant'),
   (5, 
   'Senior Associate'),
   (6, 
   'Associate'),
   (7, 
   'Trainee'),
   (8, 
   'Apprentice');

# populate competency table

INSERT INTO Competency (comp_id, apprentice, trainee, associate, senior_associate, consultant, manager, principal)
   VALUES ('Personal Performance', 
   # Apprentice
   'Understands own strengths and areas of development. Self-aware of own well being and seeks support where appropriate.
Works with People Manager to sets and achieve goals by monitoring progress regularly against performance.
Flexible and willingness to learn on the job while proactively keeping up to date with the knowledge and skills needed.
Understands the company values and applies this to own principles. Is open and honest and acts respectfully with others and customers.', 
# Trainee
   'Understands others strengths and areas for development. Recognising diversity and its value within self and team. Proactively uses wellbeing tools to support self-regulation.
Able to identify own goals and discusses these with People Manager. Understands the need to work conscientiously to achieve tasks on schedule.
Identifies learning gaps and seeks out opportunities to improve skills. Open to developmental feedback from others.
Demonstrates positive behaviours when dealing with others and ensures application of the values while working and representing Kainos to our customers.',
# Associate
   'Seeks out new challenges and opportunities that may stretch current abilities. Builds on own self-awareness of overall wellbeing.
Recognises the need for SMART goals, and demonstrates a “can do” attitude, through having own internal standards of performance.
Seeks out opportunities to improve skills beyond the role scope whilst also seeking regular feedback.
Encourages positive behaviours in others, while role modelling the Kainos values.',
# Senior Associate
   'Understands and confidently articulates own learning and developmental needs and proactively seek opportunities to gain experience.Has a strong level of self-awareness and in tune with own wellbeing needs and intuitive of others.
Seeks and responds positively to feedback regarding own learning and development. Approach with a willingness to take on tasks that are outside role scope.
Looks for opportunities to take on new challenges while proactively supporting and encouraging others in identifying learning needs.
Recognises inappropriate behaviours and challenges constructively while promoting the Kainos values. Adapting behaviours and acting in the most appropriate way to enable others to respond constructively.',
  
# Consultant
   'Understands own personal preferences, biases and values different cultures, backgrounds and circumstances in decision making and takes actions.Champions Kainos wellbeing offerings and provides direction to the various wellbeing guides and support available for our people.
Consistently sets own goals and manages this independently. Making autonomous decisions and are able to ‘get on with the job’ escalating decisions only when appropriate.
Identifies and addresses team or individual capability requirements and gaps to deliver current and future work. Consistently identifies and develops self and others to support talent development.
Demonstrates professional and organisational values through actions and behaviours. Behaves in an inclusive manner and respects equality and diversity.',
# Manager
	'Reflects on how factors such as own values, prejudices and emotions influences own judgement, behaviour, and self-belief. Uses feedback from appraisals and other sources to consider personal impact and changes behaviour. Understands personal sources of stress and wellbeing. 
Plans and manages own time effectively and fulfils work requirements and commitments to a high standard, without compromising own health and wellbeing. Remains calm and focused under pressure. 
Proactively manages self and career and identifies personal learning needs plan and completes a broad range of formal and informal learning opportunities by taking responsibility for own personal development and seeking opportunities for learning. Strives to put learning into practice. Clearly demonstrates that leadership and technical skills are equally valued.  
Behaves in an open, honest, and inclusive manner, upholding personal and organisational ethics and values. Shows respect for the needs of others and promotes equality and diversity. ',
# Principal
	'Uses sophisticated tools and sources to continuously learn about own leadership impact across the wider business community and improve personal effectiveness as a senior leader. Understands how pressures associated with carrying out a high-profile role impacts personally and own performance. 
Remains focused on the wider Kainos strategic goals when faced with competing and, at times, conflicting demands arising from differing priorities. 
Identifies where the need to personally get involved to achieve the most benefit for the wider organisation. 
Develops through systematically scanning the external environment and exploring leading edge thinking and best practice. Applies learning to build and refresh the business. Treats challenge as a positive force for improvement. 
Actively develops and protects Kainos through promoting and role modelling our values and competencies to achieve desired culture. Ensuring the business priorities maximise sustainability, equality, and diversity. '
   ),
   ('Working with Others', 
   # Apprentice
   'Understand how to respond constructively to developmental feedback from a diverse range of people and implement changes as a result.
Displays high levels of enthusiasm, energy and pace to achieve performance and results.
Recognises the need to build internal networks within immediate teams and projects. 
Respects others by attending meetings on time and contributing where appropriate. Recognising how current role relates to others within Capability and project.', 
	# Trainee
   'Shares learning with the team and other colleagues, contributing to the team’s understanding. 
 
Maintains consistent performance, challenging self and others to be positive and focused on achieving results, despite setbacks. Support others to work in a way that is mutually supportive.
 
Builds strong working relationships within team and project teams and start to consider building a wider network. 
Aware of the consequences of own behaviour and how this may affect others within the team. Supports the sharing of knowledge, information and learning with other colleagues. ',
    # Associate
   'Actively take opportunities to learn from a diverse range of people, to maximise performance and mentor/coach more junior colleagues. 
Is creative in finding ways to learn and personally improve results, suggesting new approaches to benefit self and the team. Review progress against goals making necessary adjustments to deliver successfully. 
Consistently collaborates within immediate teams and finds opportunities to build rapport and trust while supporting others.  Proactively contribute to the work of the whole team whilst building positive colleague relationships  
 
Actively participates and cooperates to support others within the team to achieve common goals. Able to interact effectively in stressful or frustrating 
situations, knowing when to step away for composure. ',
   # Senior Associate
   'Proactively supports the development of other team members while identifying opportunities to increase innovation to achieve team’s objectives. 
Encourages both formal and informal learning opportunities, ensuring others take responsibility for own learning and share this to increase organisational capability. Support and stretches self and others to deliver agreed goals and objectives. 
Effectively builds wider networks across projects, Capabilities and BUs and constructively challenges colleagues including those in positions of authority. 
Encourages collaborative team working within immediate teams and across the whole business. Supports an environment where others can make mistakes and learn from it. 
Open to giving and receiving honest feedback in order to highlight areas of improvement and recognise high performance. ',
   # Consultant
   'Support and empower team members through a range of activities to include coaching and mentoring. Demonstrate that leadership and technical skills are equally valued.
 
Role model continuous learning and self development, evaluating own effectiveness and growth. Motivate others to achieve through challenging times. Regularly monitor and discuss own and team’s performance expectations defined within 
the performance management system. 
Builds a strong network of collaborative relationships, in order to achieve objectives, whilst supporting wider stakeholder agendas. Recognised as an active mentor and coach and can demonstrate examples of  coaching others in immediate teams to improve performance. 
Encourages involvement from others to deliver through collaboration better results for Kainos. Recognises and builds on individual strengths of colleagues and team 
members while building relationships based on trust. Consistently publicise what the team members have achieved and give feedback and recognition awards where appropriate. 
',
   # Manager
	'Supports others in delivering high quality services and excellence by supporting mobilising teams and contributing to business improvement. 
Seeks and acknowledges the views and inputs of others. Shows respect for the contributions and challenges of others through positive and constructive feedback. 
Uses information and data about performance to identify improvements which will strengthen services. 
Identifies where working and cooperating with others can result in better services. Endeavours to work collaboratively. Communicates with and listens to others, recognising different perspectives. Empathises and considers the needs and feelings of others. Gains and maintains trust and support. 
Understands roles, responsibilities, and purpose within the team. Adopts a collaborative approach and respects team decisions. 
',
	# Principal
	'Removes barriers to preventing business improvement and innovation across Kainos. Drives innovation and diversity and enables inclusive environments while challenging and empowering others to lead. 
Improves company performance through engaging the company’s purpose both internally and externally. 
Promotes an inclusive culture that enables people to perform to their best, 
ensuring that appropriate performance management systems are in place and that performance data is systematically evaluated and fed into future plans. 
Takes a strategic and objective perspective to identifying potential and capability needs of Kainos, identifying and nurturing future leaders and innovators. 
Drives and delivers a culture that emphasises continuous improvement and effective team working relationships. Not afraid to lead in challenging times and make the hard decisions and communicate to the whole business with confidence and integrity. 
'),
   ('Setting Direction, Development and Accountability', 
   # Apprentice
   'Understands role, tasks and deadlines and work towards these, escalating any issues where appropriate to People/Project Manager. 
Accepts personal responsibility for quality and timelines of work set. 
Works to manage diary, commitments and ready to attend meetings on time. 
Actively supports new initiatives and tries different ways of doing things, learning from others’ experiences.', 
   # Trainee
   'Plans time effectively to ensure deadlines are met, and seen to be honest, escalating in advance any issues with completing tasks within the specified time. 
Takes ownership of all responsibilities within own role and honours commitments to others and to Kainos. 
Effectively manages diary, coming prepared for meetings and actively listen. 
Breaks down issues, and actively seeks further information and understanding. ',
    # Associate
   'Recognises how much time is required for different tasks and start to prioritise and communicate effectively within teams. Seeking appropriate support while supporting peers and junior team members. 
Identifies commitments and proactively seeks responsibility in delivering towards the wider team and project objectives. 
Establishes effective meetings through setting an agenda and coming prepared and speaking on projects calls where appropriate. Follows up and delivers upon actions from meetings.
 
Makes suggestions for improvements to personal work and processes.  
',
   # Senior Associate
   'A strong ability to multitask and prioritise to deadlines, overcoming obstacles to ensure the work is completed within time. Researching and communicating in advance any barriers that may affect projects. 
Demonstrates individual responsibility for achieving objectives and able to 
articulate success, failures and proposing remedial actions.
 
Consistently prepared for meetings and effectively manages own diary for preparation and an agenda is set in advance. Actively seeks input from colleagues and challenges others where appropriate. 
Processes and distils a variety of information to understand a problem fully while proposing options for solutions and building on the ideas of others. ',
   # Consultant
   'Develops effective systems to organise and track workload while, motivating and encouraging others to achieve planned results, delegating work to use people and resources to best effect. Ensuring colleagues are aware of any changing priorities and monitor progress. 
Delegates authority to match responsibilities and holds staff accountable for agreed-upon commitments. Within immediate teams creates accountability by using experience and advice to guide others. 
Sets an example of leading internal and external meetings through preparation, prioritisation, and considered agendas, ensuring any challenges and issues are discussed. 
Seeks the opinions and experiences of others to understand different approaches while thinking laterally about own work and encouraging creative problem solving.',
   # Manager
	'Understands the range of factors which determine why changes are made and supports Kainos senior leaders to deliver key messages. 
Gathers data and information about aspects of the business, analyses evidence and uses this knowledge to suggest changes that will improve services in the future. Questions established practices which do not add value. Puts forward creative suggestions to improve the quality of service provided. 
Consults with others and contributes to decisions including the future direction/vision of own business area or projects. 
Assesses the effects of change on service delivery and customer outcomes. Makes recommendations for future improvements. 
',
	# Principal
	'Develops an in-depth insight into the dynamics and issues surrounding Kainos including political, economic, social, environmental, technological, and legal impacts. Fully understands the impact of change on organisation culture and proactively seeks feedback and ideas from employees and stakeholders while also empowering leaders. 
Creates an environment that fosters knowledge sharing and innovation, demonstrating the courage to take risks to enable significant improvements and empowering others to do so where appropriate. Creates a culture of flexibility and responsiveness, mobilising Kainos to respond quickly to changing priorities. 
Fully engages and utilises external experts wider experience and knowledge to support strategic decision making. Navigates and balances external pressures while empowering leaders and principals to shape Kainos strategy and business priorities.  
Creates a culture of transparency and honesty when it comes to evaluating impact challenges and successes. Fostering an ethos of one Kainos. Scanning the broad internal and external environment and taking account of wider impact to develop long term implementation strategies that maximise opportunities to add value to customers and support sustainable growth. '),
   ('Supporting and Delivering the Strategy', 
   #Apprentice
	'Understands the Kainos Vision, Strategy and Principles.
	Understands the organisation structure and the purpose of Kainos.
	Possess general knowledge of local cultural differences and familiar with the Kainos policy towards Diversity and Inclusion.',
	#Trainee
   'Recognises how to contribute to the wider organisational objectives and strategic principles. Articulates. Individual contribution to the wider Kainos objectives and uses.
	Pays attention to organisational information, how well we are doing and what is changing.
	Awareness of cultural differences and willingness to develop and grow understanding of global and cultural effectiveness.',
   #Associate
   'Articulates individual contribution to the wider Kainos objectives and uses evidence by including SMART goals that align to the Capability/BU.
	Clearly defines how individual personal performance can have an impact on the business achieving the vision and objectives.
	Respects differences and promotes inclusion on a transactional level. Displays appropriate ethical behaviours and acknowledges own unconscious bias.',
   #Senior Associate
   'Supports peers and team members in understanding the wider Kainos objectives and how we all have a role in Kainos’ success.
	Recognises and reflects on how personal actions may have a wider impact on other people and teams.
	Demonstrates awareness and appreciation for the global multi-dimensional and diverse perspectives of our people. Provide a protective environment within immediate teams in which colleagues can escalate any issues while demonstrating impartial application of Kainos policies, procedure and practices.',
   #Consultant
   'Balances own teams needs with wider organisational needs while translating the Vision and Strategy into practical and tangible goals.
	Effectively ensures immediate teams understand how their work contributes to and delivers organisational priorities.
	Consistently role models cultural effectiveness in the demonstration of ethical behaviours while understanding the value diversity brings to Kainos. Promoting diversity and inclusion within teams while adapting to the needs of our diverse people.',
   #Manager
   'Strategic awareness including an understanding and knowledge of how role and those within in immediate team fit with and support delivery of the organisational objectives.
	Feeds in ideas and knowledge from immediate teams and supports the senior leaders in developing a strategy.
	Support, develop and implement the strategy in immediate teams. 
	Passionately advocates the strategy and vision and translates this into action and opportunities within immediate teams. Understands the need for OKR’s/KPI’s and own role in supporting and shaping in relation to immediate teams.',
   #Executive
   'Sets, maintains, and ensures a clear direction for Kainos with highly focused priorities and results by articulating short, medium-and long-term strategies focused on adding real value to Kainos and our customers
	Creates joined up strategies and plans which help put into practice and support Kainos vision and long-term direction which are challenging yet achievable. Based upon external economic, social, technology and environmental trends.
	Enables the whole company to remain focused on business priorities, irrespective of challenges. Swiftly refocuses Kainos on new priorities as changing situations dictate. Models personal resilience and accountability for achieving strategic priorities and results. Balances challenging operational and strategic priorities.
	Establishes transparency and trust where results are discussed openly. Encourages and inspires the organisation to energise delivery, while driving a performance culture across Kainos and achieve results through others. Monitors and evaluates strategic outcomes, adjusting to ensure sustainability of the strategy and ongoing communication and engagement.'),
   ('Commerciality and Risk', 
	#Apprentice
	'Understands the Kainos Vision, Strategy and Principles.
	Understands the organisation structure and the purpose of Kainos.
	Possess general knowledge of local cultural differences and familiar with the Kainos policy towards Diversity and Inclusion.',
	#Trainee
   'Recognises how to contribute to the wider organisational objectives and strategic principles.
	Pays attention to organisational information, how well we are doing and what is changing.
	Awareness of cultural differences and willingness to develop and grow understanding of global and cultural effectiveness.',
   #Associate
   'Articulates individual contribution to the wider Kainos objectives and uses evidence by including SMART goals that align to the Capability/BU.
	Clearly defines how individual personal performance can have an impact on the business achieving the vision and objectives.
	Respects differences and promotes inclusion on a transactional level. Displays appropriate ethical behaviours and acknowledges own unconscious bias.',
   #Senior Associate
   'Supports peers and team members in understanding the wider Kainos objectives and how we all have a role in Kainos’ success.
	Recognises and reflects on how personal actions may have a wider impact on other people and teams.
	Demonstrates awareness and appreciation for the global multi-dimensional and diverse perspectives of our people. Provide a protective environment within immediate teams in which colleagues can escalate any issues while demonstrating impartial application of Kainos policies, procedure and practices.',
   #Consultant
   'Balances own teams needs with wider organisational needs while translating the Vision and Strategy into practical and tangible goals.
	Effectively ensures immediate teams understand how their work contributes to and delivers organisational priorities.
	Consistently role models cultural effectiveness in the demonstration of ethical behaviours while understanding the value diversity brings to Kainos. Promoting diversity and inclusion within teams while adapting to the needs of our diverse people.',
   #Manager
   'Aware of the importance of effective commercial behaviours and the needs of the business. Identifies and ensures that personal objectives are focussed on innovative solutions to achieve commercial outcomes and objectives as well as contributing to our growth ambitions. Recognises when products or services are not being  delivered to the required level of quality or standard and takes appropriate action. 
	Contributes to development of new business through involvement in BD process, for example, bid/proposal writing, customer presentations, pricing solutions. Establishes trusted customer relationships and adds value by helping and advising customers in areas beyond current project work, identifying possible areas where additional Kainos business can be generated.
	Looks to support and drive efficiencies and profitability through immediate team. Reviews processes within own teams and challenges through the right behaviours and channels to support the overall commercial objectives. 
	Understands and protects Kainos from risks associated with contractual commitments. Takes a balanced risk and reward view to activities and commitments while managing quality and Kainos interests. 
	Supports and aligns to Kainos policies and processes escalating or challenging where appropriate. Ensures compliance across own team.',
   #Executive
   'Role models leadership, influencing and accountability in relation to commerciality and risks to create and deliver the corporate plan. Creates and embeds a culture of commercial awareness and solid business acumen, ensuring that all employees understand the commercial environment in which we operate and can pro- actively play a part in delivering change, efficiency and growth. 
	Role model for others to follow. Inspires staff across the whole organisation to contribute to BD and celebrate its success. Champions BD, promoting Kainos at levels including internal ‘all hands’, partners, investors, customers and senior figureheads within regions. Takes responsibility for strategic investment decisions, for example, acquisitions, new markets, new regions.
	Draws on insights of current and future marketplace dynamics to seize opportunities to stimulate sustainable growth. Drives and delivers a continuous pipeline of innovation through our business models, products, and services ensuring sustainable commercial growth. 
	Makes and encourages strategic investment decisions, challenging to ensure appropriate levels of expenditure and maximise return. Demonstrates transparency both in terms of key investment decisions and appropriate use of resources. Initiates and build strategic commercial relationships with the shareholder, partners, customers, and competitors to deliver results. 
	Sets clear direction against all processes and policies and ensures we continue to develop and adapt to the ever-evolving risks and changes to the needs of the whole business.'
),
   ('Communicating and Influence',
   #Apprentice
   'Acts in a respectful manner in all forms of communication while being open and honest. Displays a positive approach when interacting with others.
	Recognises influencing as a key skill required to work effectively with internal and external customers.
	Acts in accordance with the Kainos values demonstrating through own behaviours and interactions with colleagues and customers.', 
    #Trainee
   'Communicates own views in a clear and constructive manner, while listening to different views and considers all employees from various backgrounds.
	Observes team/colleagues influencing internally and externally and understands the benefits of adapting personal style to shape, motivate and influence effectively.
	Understands who our customers are and what problems the team is trying to solve.',
   #Associate
   'Involved at meetings, asking questions, listening and develops and presents a well-reasoned point of view. Remaining communicative and clear in own thoughts and ideas when approached by others, giving consideration to the communication needs of other staff and customers.
	Demonstrates influencing skills internally and able to communicate points clearly and open to feedback from others.
	Demonstrates how to participate in stakeholder management, escalates effectively, and strives to provide a quality service and showcase Kainos positively.',
   #Senior Associate
   'Recognises and respect that communication is a two-way process and demonstrate effective questioning and active listening skills to achieve this. Confidently handles challenging conversations and is clear and constructive in response.
	Persuades and influences with sound rationale argument ‘appealing to others’ interest or reason to gain support.
	Authentic in stakeholder relationships and take pride in being inclusive and trustworthy while keeping promises made with customers. Responds honestly and promptly to customer requests and whenever possible within agreed timeframes.',
   #Consultant
   'Uses communication to create a shared sense of purpose and direction. Adapting own style to effectively communicate and able to demonstrate this when difficult conversations have a positive outcome.
	Acts as an influential and effective member of multi-disciplinary teams or projects. Initiates collaboration and actively encourages people to cooperate in initiatives where they can add value.
	Assesses customer needs accurately by listening and applying sensitive questioning. Managing customer expectations in relation to scope of work and are honest in what can and cannot be achieved within timescales. Confident in negotiating with customers to reflect changes in scope of work.',
   #Manager
   'Provides feedback and support in communicating the vision, and advocates within immediate teams.
	Credible communicator, displaying authenticity and adapting influencing style for different audiences.
	Articulates the need for changes to processes and systems, acknowledging the impact on people and services.
	Applies and adapts various approaches to stakeholder management through influencing and negotiating to maximise business for Kainos by developing and maintaining internal and external networks.',
   #Executive
   'Actively engages key stakeholders in creating a bold, innovative, shared vision which reflects the future needs and aspirations of the whole company and the future direction of Kainos. Thinks broadly and aligns the vision to the Kainos values and communicates gaining buy in.
	Takes action to shape and implement a vision for the future of Kainos and our customers while sharing leadership and empowering others to contribute and collaborate.
	Empowers senior leaders within Kainos to drive change and transformation while providing direction and creating a collaborative environment for sustained change.
	Builds a strong network of collaborative relationships and partnerships globally to achieve our objectives, whist supporting wider stakeholder agendas. Utilises the experience and input of external partners, non-executive directors, and industry experts to improve effectiveness.')
;

# populate training table

INSERT INTO Training (training_id, training, sharepoint_url)
   VALUES (1, 'Mindset Module', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Mindset.aspx'), # all bands
   (2, 'Hybrid Working – A guide to working remotely', 'https://kainos.talentlms.com/learner/courseinfo/id:275'), # all bands
   (3, 'Effective Time Management', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Time-Management.aspx'), # 7-3
   (4, 'Train The Trainer', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Train-The-Trainer.aspx'), #  Associate Level Plus 
   (5, 'Having Courageous Conversations', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Crucial-Conversations.aspx'), #Senior Associates Plus
   (6,'Leading Change','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Leading-Change.aspx'), #Principal to Leader
   (7,'Managing Change','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Managing-Change.aspx'), #Consultant to Manager
   (8,'Effective Decision Making ','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Effective-Decision-Making.aspx'); #Consultant to Leader Bands

# connecting table for training to band as a band can have many training and a training can have many bands
   
INSERT INTO Training_Bands (training_id, band_id)
   VALUES
   (1,2),
   (1,3),
   (1,4),
   (1,5),
   (1,6),
   (1,7),
   (1,8),
   (2,2),
   (2,3),
   (2,4),
   (2,5),
   (2,6),
   (2,7),
   (2,8),
   (3,4),
   (3,5),
   (3,6),
   (3,7),
   (3,8),
   (4,2),
   (4,3),
   (4,4),
   (4,5),
   (4,6),
   (5,2),
   (5,3),
   (5,4),
   (5,5),
   (6,2),
   (7,3),
   (7,4),
   (5,2),
   (8,3),
   (8,4)
 ;
 
INSERT INTO Employee_Fact VALUES
    (167,498138869,6,'Trainee Software Engineer','Engineering','Engineering ','1979-11-02 00:00:00','S','M','2008-12-02 00:00:00',25,32,1,'ED7EE92E-A9D0-4E3A-8DEE-4B143E459F7E','2014-06-30 00:00:00',167,18980,'Belfast '),
    (170,476115505,6,'Trainee Data Engineer','Data Engineering','Data & AI','1977-04-16 00:00:00','M','M','2008-12-21 00:00:00',26,33,1,'01B119A2-2AF3-4775-818E-B421FECB07A7','2014-06-30 00:00:00',170,18980,'Gdansk'),
    (172,364818297,6,'Trainee data Analyst','Analysis & Data Architecture ','Data & AI','1986-10-24 00:00:00','M','M','2009-01-16 00:00:00',22,31,1,'1F151ABC-DB4A-431A-8A5D-15F46C5B8FFC','2014-06-30 00:00:00',172,18980,'Birmingham '),
    (175,259388196,6,'Trainee test Engineer','Testing and Quality Assurance','Engineering ','1989-01-08 00:00:00','M','M','2009-02-02 00:00:00',23,31,1,'B3967C00-7014-4960-AF15-B1A6D3094F6F','2014-06-30 00:00:00',175,18980,'Birmingham '),
    (176,860123571,6,'Trainee Data Engineer','Data Engineering','Data & AI','1985-09-23 00:00:00','M','M','2009-02-14 00:00:00',29,34,1,'85AFB689-7EAB-41A8-B154-9446195D5BDE','2014-06-30 00:00:00',176,18980,'Belfast '),
    (177,551346974,6,'Trainee Software Engineer','Engineering','Engineering ','1982-02-11 00:00:00','M','M','2009-02-21 00:00:00',24,32,1,'D54C7989-2675-4EF3-B392-370A8D264B2B','2014-06-30 00:00:00',177,18980,'Gdansk'),
    (178,568626529,6,'Trainee data Analyst','Analysis & Data Architecture ','Data & AI','1982-03-24 00:00:00','S','M','2009-03-03 00:00:00',27,33,1,'96C7EAB1-6DEA-4C59-AFD8-923F0E8DE1F6','2014-06-30 00:00:00',178,18980,'Birmingham '),
    (174,585408256,6,'Trainee data Analyst','Analysis & Data Architecture ','Data & AI','1986-01-05 00:00:00','S','M','2009-01-27 00:00:00',28,34,1,'F1A6F824-895B-4A0F-AF1B-05FBA703E69F','2014-06-30 00:00:00',174,19710,'Birmingham '),
    (178,568626529,6,'Trainee test Engineer','Testing and Quality Assurance','Engineering ','1982-03-24 00:00:00','S','M','2009-03-03 00:00:00',27,33,1,'96C7EAB1-6DEA-4C59-AFD8-923F0E8DE1F6','2014-06-30 00:00:00',178,20440,'Belfast '),
    (167,498138869,6,'Trainee data Analyst','Analysis & Data Architecture ','Data & AI','1979-11-02 00:00:00','S','M','2008-12-02 00:00:00',25,32,1,'ED7EE92E-A9D0-4E3A-8DEE-4B143E459F7E','2014-06-30 00:00:00',167,21170,'Gdansk'),
    (170,476115505,6,'Trainee Software Engineer','Engineering','Engineering ','1977-04-16 00:00:00','M','M','2008-12-21 00:00:00',26,33,1,'01B119A2-2AF3-4775-818E-B421FECB07A7','2014-06-30 00:00:00',170,21170,'Birmingham '),
    (172,364818297,6,'Trainee test Engineer','Testing and Quality Assurance','Engineering ','1986-10-24 00:00:00','M','M','2009-01-16 00:00:00',22,31,1,'1F151ABC-DB4A-431A-8A5D-15F46C5B8FFC','2014-06-30 00:00:00',172,21170,'Birmingham '),
    (174,585408256,6,'Trainee Software Engineer','Engineering','Engineering ','1986-01-05 00:00:00','S','M','2009-01-27 00:00:00',28,34,1,'F1A6F824-895B-4A0F-AF1B-05FBA703E69F','2014-06-30 00:00:00',174,21170,'Belfast '),
    (175,259388196,6,'Trainee Data Engineer','Data Engineering','Data & AI','1989-01-08 00:00:00','M','M','2009-02-02 00:00:00',23,31,1,'B3967C00-7014-4960-AF15-B1A6D3094F6F','2014-06-30 00:00:00',175,21170,'Gdansk'),
    (176,860123571,6,'Trainee test Engineer','Testing and Quality Assurance','Engineering ','1985-09-23 00:00:00','M','M','2009-02-14 00:00:00',29,34,1,'85AFB689-7EAB-41A8-B154-9446195D5BDE','2014-06-30 00:00:00',176,21170,'Belfast '),
    (177,551346974,6,'Trainee data Analyst','Analysis & Data Architecture ','Data & AI','1982-02-11 00:00:00','M','M','2009-02-21 00:00:00',24,32,1,'D54C7989-2675-4EF3-B392-370A8D264B2B','2014-06-30 00:00:00',177,21170,'Birmingham '),
    (4,112457891,5,'Data Engineer','Data Engineering','Data & AI','1974-12-23 00:00:00','S','M','2007-12-05 00:00:00',48,80,1,'59747955-87B8-443F-8ED4-F8AD3AFDF3A9','2014-06-30 00:00:00',4,25170.4,'Belfast '),
    (224,621209647,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1981-11-06 00:00:00','M','M','2009-01-07 00:00:00',45,42,1,'1A68CD62-6FE9-4613-90D4-2CD178E4E54A','2014-06-30 00:00:00',224,25170.4,'Gdansk'),
    (122,586486572,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1978-02-17 00:00:00','S','F','2008-12-07 00:00:00',97,68,1,'923ECFD6-E202-429A-9141-6CB183531439','2014-06-30 00:00:00',122,26280,'Birmingham '),
    (124,420776180,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1984-04-30 00:00:00','S','F','2008-12-26 00:00:00',98,69,1,'6150F197-7923-40D4-84F2-936207D468AB','2014-06-30 00:00:00',124,26280,'Birmingham '),
    (126,652779496,5,'Data Engineer','Data Engineering','Data & AI','1985-05-04 00:00:00','M','M','2009-02-26 00:00:00',96,68,1,'96442787-9520-4955-A457-38AFDDB6FF13','2014-06-30 00:00:00',126,26280,'Belfast '),
    (229,879334904,5,'Software Engineer','Engineering','Engineering ','1970-07-31 00:00:00','M','F','2010-02-16 00:00:00',90,65,1,'929FE187-EE24-4F5F-AF2A-F96324F09423','2014-06-30 00:00:00',229,27010,'Gdansk'),
    (230,28414965,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1971-12-17 00:00:00','M','M','2010-03-05 00:00:00',88,64,1,'CC2791E6-7629-49C5-922A-81445AFDF033','2014-06-30 00:00:00',230,27010,'Birmingham '),
    (231,153479919,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1954-04-24 00:00:00','M','F','2010-03-07 00:00:00',91,65,1,'39AF5CCA-9B52-41E5-B510-72901D2578F6','2014-06-30 00:00:00',231,27010,'Birmingham '),
    (232,646304055,5,'Data Engineer','Data Engineering','Data & AI','1970-12-03 00:00:00','S','M','2010-01-27 00:00:00',89,64,1,'49238447-30EE-4009-993F-0B6C756AB436','2014-06-30 00:00:00',232,27010,'Belfast '),
    (72,443968955,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1977-05-14 00:00:00','M','M','2008-12-01 00:00:00',41,40,1,'0A8937C9-68AA-4D48-BA4E-B40493D764AA','2014-06-30 00:00:00',72,27740,'Gdansk'),
    (73,138280935,5,'Software Engineer','Engineering','Engineering ','1983-10-19 00:00:00','M','F','2008-12-19 00:00:00',42,41,1,'C76A41F1-A390-4AE4-A82A-2A87764C6391','2014-06-30 00:00:00',73,27740,'Toronto'),
    (74,420023788,5,'Data Engineer','Data Engineering','Data & AI','1989-11-06 00:00:00','S','M','2009-01-07 00:00:00',43,41,1,'A942E1E0-2D5E-4858-97C0-947020E96860','2014-06-30 00:00:00',74,27740,'Birmingham '),
    (75,363996959,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1982-06-27 00:00:00','S','M','2009-01-26 00:00:00',44,42,1,'F359F5B6-5E18-4C62-8531-14D951911CE5','2014-06-30 00:00:00',75,27740,'Belfast '),
    (76,227319668,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1988-10-17 00:00:00','M','F','2009-02-12 00:00:00',45,42,1,'8D0182A3-5B59-4EEA-9B3C-C7F05DA9A2CE','2014-06-30 00:00:00',76,27740,'Gdansk'),
    (77,301435199,5,'Software Engineer','Engineering','Engineering ','1983-05-13 00:00:00','M','F','2009-03-03 00:00:00',46,43,1,'2EE7914A-62D3-473B-A0E1-E4E55341EC4E','2014-06-30 00:00:00',77,27740,'Belfast '),
    (123,337752649,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1977-03-18 00:00:00','M','M','2008-12-07 00:00:00',95,67,1,'A8838AB2-99DE-415C-8675-D82EBF1C4752','2014-06-30 00:00:00',123,27740,'Birmingham '),
    (125,584205124,5,'Software Engineer','Engineering','Engineering ','1973-11-11 00:00:00','M','M','2009-01-20 00:00:00',94,67,1,'54ED63DC-C62C-4CC7-89C2-015DF49C49A5','2014-06-30 00:00:00',125,27740,'Belfast '),
    (146,160739235,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1989-06-25 00:00:00','S','M','2008-12-07 00:00:00',36,38,1,'6FFF136A-9664-4EB9-9243-FAC76E21B9DD','2014-06-30 00:00:00',146,27740,'Gdansk'),
    (147,604664374,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1975-11-05 00:00:00','M','F','2008-12-26 00:00:00',37,38,1,'F69F3FF9-E1E0-4419-A6BF-F705E1556160','2014-06-30 00:00:00',147,27740,'London'),
    (148,733022683,5,'Software Engineer','Engineering','Engineering ','1988-12-07 00:00:00','S','M','2009-01-14 00:00:00',38,39,1,'C16C501D-942D-4EB0-B5C4-EF8119FBEBA2','2014-06-30 00:00:00',148,27740,'Birmingham '),
    (149,764853868,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1983-10-20 00:00:00','M','M','2009-01-31 00:00:00',39,39,1,'615A6BFE-3046-4037-9764-238535F725BE','2014-06-30 00:00:00',149,27740,'Belfast '),
    (150,878395493,5,'Software Engineer','Engineering','Engineering ','1982-09-18 00:00:00','M','M','2009-02-26 00:00:00',35,37,1,'2B0876D4-8996-4E71-A613-BE2E98E7ACCF','2014-06-30 00:00:00',150,27740,'Gdansk'),
    (151,993310268,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1977-09-13 00:00:00','M','M','2009-02-19 00:00:00',40,40,1,'00027A8C-C2F8-4A31-ABA8-8A203638B8F1','2014-06-30 00:00:00',151,27740,'Toronto'),
    (167,498138869,5,'Software Engineer','Engineering','Engineering ','1979-11-02 00:00:00','S','M','2008-12-02 00:00:00',25,32,1,'ED7EE92E-A9D0-4E3A-8DEE-4B143E459F7E','2014-06-30 00:00:00',167,27740,'Birmingham '),
    (168,271438431,5,'Data Engineer','Data Engineering','Data & AI','1984-08-25 00:00:00','S','M','2008-12-07 00:00:00',34,37,1,'A6F5F72F-AA03-41B7-8B6E-B123BD360753','2014-06-30 00:00:00',168,27740,'Belfast '),
    (169,351069889,5,'Software Engineer','Engineering','Engineering ','1983-04-02 00:00:00','S','F','2008-12-14 00:00:00',31,35,1,'F73D75D5-B47B-46EE-AD11-7BF13DD6C55D','2014-06-30 00:00:00',169,27740,'Gdansk'),
    (170,476115505,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1977-04-16 00:00:00','M','M','2008-12-21 00:00:00',26,33,1,'01B119A2-2AF3-4775-818E-B421FECB07A7','2014-06-30 00:00:00',170,27740,'Belfast '),
    (171,746373306,5,'Software Engineer','Engineering','Engineering ','1981-08-03 00:00:00','S','M','2009-01-02 00:00:00',32,36,1,'84C358D4-2493-452C-B7D6-B212C893A009','2014-06-30 00:00:00',171,27740,'Birmingham '),
    (172,364818297,5,'Data Engineer','Data Engineering','Data & AI','1986-10-24 00:00:00','M','M','2009-01-16 00:00:00',22,31,1,'1F151ABC-DB4A-431A-8A5D-15F46C5B8FFC','2014-06-30 00:00:00',172,27740,'Belfast '),
    (173,87268837,5,'Software Engineer','Engineering','Engineering ','1987-07-15 00:00:00','S','M','2009-01-21 00:00:00',33,36,1,'1BA1D374-18AE-48ED-938F-6F5D2EEC4D4D','2014-06-30 00:00:00',173,27740,'Gdansk'),
    (174,585408256,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1986-01-05 00:00:00','S','M','2009-01-27 00:00:00',28,34,1,'F1A6F824-895B-4A0F-AF1B-05FBA703E69F','2014-06-30 00:00:00',174,27740,'London'),
    (175,259388196,5,'Software Engineer','Engineering','Engineering ','1989-01-08 00:00:00','M','M','2009-02-02 00:00:00',23,31,1,'B3967C00-7014-4960-AF15-B1A6D3094F6F','2014-06-30 00:00:00',175,27740,'Birmingham '),
    (176,860123571,5,'Data Engineer','Data Engineering','Data & AI','1985-09-23 00:00:00','M','M','2009-02-14 00:00:00',29,34,1,'85AFB689-7EAB-41A8-B154-9446195D5BDE','2014-06-30 00:00:00',176,27740,'Belfast '),
    (177,551346974,5,'Software Engineer','Engineering','Engineering ','1982-02-11 00:00:00','M','M','2009-02-21 00:00:00',24,32,1,'D54C7989-2675-4EF3-B392-370A8D264B2B','2014-06-30 00:00:00',177,27740,'Gdansk'),
    (178,568626529,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1982-03-24 00:00:00','S','M','2009-03-03 00:00:00',27,33,1,'96C7EAB1-6DEA-4C59-AFD8-923F0E8DE1F6','2014-06-30 00:00:00',178,27740,'London'),
    (179,587567941,5,'Software Engineer','Engineering','Engineering ','1974-11-15 00:00:00','S','M','2009-03-05 00:00:00',30,35,1,'975F827D-BE71-4EB1-8DBF-E6C451D1FAD5','2014-06-30 00:00:00',179,27740,'Birmingham '),
    (233,552560652,5,'Software Engineer','Engineering','Engineering ','1971-08-27 00:00:00','M','M','2009-12-21 00:00:00',87,63,1,'0A4BCC09-ACE5-4481-9067-8B9ED70ECA18','2014-06-30 00:00:00',233,28470,'Belfast '),
    (250,895209680,5,'Software Engineer','Engineering','Engineering ','1978-02-10 00:00:00','S','F','2011-02-25 00:00:00',49,44,1,'7D6B0155-0191-4599-8394-378EBDE63C9A','2014-06-30 00:00:00',250,28791.2,'Gdansk'),
    (161,275962311,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1985-02-06 00:00:00','S','M','2008-12-15 00:00:00',74,57,1,'08D25BAA-167B-499C-8B51-31DCC856A8CF','2014-06-30 00:00:00',161,29200,'Toronto'),
    (162,514829225,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1980-12-25 00:00:00','S','F','2009-01-03 00:00:00',75,57,1,'FCCD65BA-2702-4409-AE56-75AF1710AC78','2014-06-30 00:00:00',162,29200,'Birmingham '),
    (163,377784364,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1990-04-13 00:00:00','M','M','2009-02-08 00:00:00',77,58,1,'B96BC9C2-5A25-4A9B-887A-C7C10E47B80C','2014-06-30 00:00:00',163,29200,'Belfast '),
    (164,65848458,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1988-09-24 00:00:00','S','M','2009-03-06 00:00:00',73,56,1,'A2A2CF20-4E5C-45F7-A7BD-1B94F0C3A43A','2014-06-30 00:00:00',164,29200,'Gdansk'),
    (165,539490372,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1988-12-16 00:00:00','M','M','2009-01-22 00:00:00',76,58,1,'300223F3-5587-4230-909B-D9C4AFD6D683','2014-06-30 00:00:00',165,29200,'Belfast '),
    (187,713403643,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1989-04-15 00:00:00','M','F','2008-12-09 00:00:00',79,59,1,'83C6DABF-FD7D-4F5B-BB22-EB7EEBB9A772','2014-06-30 00:00:00',187,29200,'Birmingham '),
    (188,435234965,5,'Data Engineer','Data Engineering','Data & AI','1985-11-24 00:00:00','M','M','2008-12-27 00:00:00',80,60,1,'1AB0EDEB-7558-4734-8423-5A11B44DCA35','2014-06-30 00:00:00',188,29200,'Belfast '),
    (189,187369436,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1972-07-24 00:00:00','S','F','2009-01-15 00:00:00',81,60,1,'8261B8CB-BC3F-4BCE-B364-86035D870263','2014-06-30 00:00:00',189,29200,'Gdansk'),
    (190,456839592,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1985-02-28 00:00:00','S','M','2009-02-02 00:00:00',82,61,1,'2203154E-5EBD-4ACA-99BE-D835A3309D03','2014-06-30 00:00:00',190,29200,'London'),
    (191,399658727,5,'Software Engineer','Engineering','Engineering ','1988-03-14 00:00:00','S','M','2009-02-26 00:00:00',78,59,1,'231B1798-F67B-45C1-9688-265180F93D28','2014-06-30 00:00:00',191,29200,'Birmingham '),
    (206,835460180,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1962-09-13 00:00:00','S','M','2008-12-02 00:00:00',84,62,1,'4F361B4F-7920-4037-9A0A-46D616F9B9C7','2014-06-30 00:00:00',206,29200,'Belfast '),
    (207,687685941,5,'Software Engineer','Engineering','Engineering ','1970-10-18 00:00:00','S','M','2008-12-02 00:00:00',85,62,1,'A36B5D6B-72A5-47F8-9F6B-5D922130E760','2014-06-30 00:00:00',207,29200,'Gdansk'),
    (208,199546871,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1987-02-10 00:00:00','M','M','2009-01-08 00:00:00',86,63,1,'E35DA50A-BB51-4E08-8B8D-87EF4650247A','2014-06-30 00:00:00',208,29200,'London'),
    (209,167554340,5,'Software Engineer','Engineering','Engineering ','1990-11-01 00:00:00','M','F','2009-01-27 00:00:00',87,63,1,'25FC84D7-E013-44B8-82CD-63CD4723AF81','2014-06-30 00:00:00',209,29200,'Birmingham '),
    (210,20244403,5,'Data Engineer','Data Engineering','Data & AI','1969-09-17 00:00:00','S','F','2009-02-20 00:00:00',83,61,1,'F714B5EC-CA7C-4E6E-A812-2C5A119F4C30','2014-06-30 00:00:00',210,29200,'Belfast '),
    (219,242381745,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1987-03-12 00:00:00','S','M','2009-01-22 00:00:00',78,59,1,'F78657A9-83EF-4B4D-9809-3C4C6D1A7BB4','2014-06-30 00:00:00',219,29930,'Gdansk'),
    (220,260770918,5,'Software Engineer','Engineering','Engineering ','1975-12-25 00:00:00','M','F','2009-02-09 00:00:00',79,59,1,'8A41ED23-7AE2-4C15-AA5D-9496E721F848','2014-06-30 00:00:00',220,29930,'London'),
    (213,343861179,5,'Software Engineer','Engineering','Engineering ','1966-12-05 00:00:00','M','M','2010-02-23 00:00:00',85,62,1,'A3DADF19-27F0-460A-9888-CE6CAA9E3583','2014-06-30 00:00:00',213,30884.548,'Birmingham '),
    (214,131471224,5,'Data Engineer','Data Engineering','Data & AI','1989-03-28 00:00:00','M','M','2009-02-02 00:00:00',84,62,1,'F4DDD64F-DFFE-4DF3-AA17-D6BEA1924818','2014-06-30 00:00:00',214,30884.548,'Belfast '),
    (215,381772114,5,'Software Engineer','Engineering','Engineering ','1986-04-30 00:00:00','S','M','2009-01-15 00:00:00',83,61,1,'6B63EF27-2C55-4F4C-BE29-FCE8B694DC4A','2014-06-30 00:00:00',215,30884.548,'Gdansk'),
    (216,403414852,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1976-03-06 00:00:00','S','M','2008-12-28 00:00:00',82,61,1,'34E128CF-D904-4327-8014-9DF0D5DE7D08','2014-06-30 00:00:00',216,30884.548,'London'),
    (56,652535724,5,'Data Engineer','Data Engineering','Data & AI','1988-07-06 00:00:00','M','F','2009-02-05 00:00:00',9,24,1,'77878C43-F16E-437D-892F-3CFCC0715A0A','2014-06-30 00:00:00',56,32120,'Birmingham '),
    (57,10708100,5,'Software Engineer','Engineering','Engineering ','1971-07-24 00:00:00','S','M','2009-02-23 00:00:00',10,25,1,'B395CD84-77BA-4D3C-A49D-D9E8D6CF100B','2014-06-30 00:00:00',57,32120,'Belfast '),
    (58,571658797,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1986-05-30 00:00:00','M','M','2008-12-05 00:00:00',11,25,1,'65207627-5521-4A8E-AD3C-B2F1B5226B85','2014-06-30 00:00:00',58,32120,'Gdansk'),
    (59,843479922,5,'Software Engineer','Engineering','Engineering ','1979-08-16 00:00:00','S','M','2008-12-24 00:00:00',12,26,1,'68616AEA-81E5-4940-A7E4-6FBA882BCCF6','2014-06-30 00:00:00',59,32120,'London'),
    (60,827686041,5,'Data Engineer','Data Engineering','Data & AI','1977-02-03 00:00:00','S','M','2009-01-11 00:00:00',13,26,1,'1F1D813D-3EDC-4274-8E9B-4519D71685B6','2014-06-30 00:00:00',60,32120,'Birmingham '),
    (61,92096924,5,'Test Engineer','Testing and Quality Assurance','Engineering ','1989-08-09 00:00:00','S','F','2009-01-18 00:00:00',8,24,1,'721A2921-C415-46DE-9111-13F25F428B8B','2014-06-30 00:00:00',61,32120,'Belfast '),
    (94,718299860,5,'Software Engineer','Engineering','Engineering ','1972-11-25 00:00:00','M','M','2008-12-12 00:00:00',6,23,1,'6B10192F-D570-47C4-82C9-3D979B1EFDC1','2014-06-30 00:00:00',94,32120,'Gdansk'),
    (95,674171828,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1986-09-08 00:00:00','M','M','2008-12-19 00:00:00',1,20,1,'6175876E-8FCC-4917-BE06-FC358515E6DF','2014-06-30 00:00:00',95,32120,'Toronto'),
    (96,912141525,5,'Software Engineer','Engineering','Engineering ','1990-01-25 00:00:00','M','F','2009-03-02 00:00:00',5,22,1,'62A9F73F-6443-4F2F-B864-18186614BFB6','2014-06-30 00:00:00',96,32120,'Birmingham '),
    (97,370581729,5,'Data Engineer','Data Engineering','Data & AI','1986-03-21 00:00:00','S','M','2009-02-10 00:00:00',0,20,1,'1F0E068A-48C5-40BF-8190-565150EFDADD','2014-06-30 00:00:00',97,32120,'Belfast '),
    (98,152085091,5,'Software Engineer','Engineering','Engineering ','1978-06-26 00:00:00','M','M','2009-02-11 00:00:00',4,22,1,'A703169F-1563-488E-914D-D784FD07F29A','2014-06-30 00:00:00',98,32120,'Gdansk'),
    (99,431859843,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1979-03-29 00:00:00','S','M','2009-01-06 00:00:00',2,21,1,'A6089357-2F2F-48CC-AB3C-D9B75A3C09D7','2014-06-30 00:00:00',99,32120,'Toronto'),
    (100,204035155,5,'Software Engineer','Engineering','Engineering ','1973-01-24 00:00:00','M','M','2009-01-12 00:00:00',7,23,1,'9B9B768D-7CC1-4DCE-87CB-765AB73A6AFF','2014-06-30 00:00:00',100,32120,'Birmingham '),
    (101,153288994,5,'Data Engineer','Data Engineering','Data & AI','1971-08-30 00:00:00','M','M','2009-01-25 00:00:00',3,21,1,'9CE8B2E8-9944-4BA5-97DE-441D8314F161','2014-06-30 00:00:00',101,32120,'Belfast '),
    (109,113695504,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1978-01-26 00:00:00','M','F','2008-12-07 00:00:00',95,67,1,'7E632B21-0D11-4BBA-8A68-8CAE14C20AE6','2014-06-30 00:00:00',109,32120,'Gdansk'),
    (110,857651804,5,'Software Engineer','Engineering','Engineering ','1979-07-06 00:00:00','S','M','2008-12-14 00:00:00',90,65,1,'9C5F84D1-FB96-4D82-92A1-F932903DEAAD','2014-06-30 00:00:00',110,32120,'London'),
    (111,415823523,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1978-02-25 00:00:00','S','M','2008-12-17 00:00:00',93,66,1,'14010B0E-C101-4E41-B788-21923399E512','2014-06-30 00:00:00',111,32120,'Birmingham '),
    (112,981597097,5,'Software Engineer','Engineering','Engineering ','1978-05-31 00:00:00','S','M','2009-01-01 00:00:00',91,65,1,'B6998410-EE0F-4307-9E6E-FE348F11012D','2014-06-30 00:00:00',112,32120,'Belfast '),
    (113,54759846,5,'Data Engineer','Data Engineering','Data & AI','1987-07-17 00:00:00','M','F','2008-12-25 00:00:00',96,68,1,'FB84759C-B687-43B2-8727-125EFE0F5E13','2014-06-30 00:00:00',113,32120,'Gdansk'),
    (114,342607223,5,'Software Engineer','Engineering','Engineering ','1978-05-07 00:00:00','M','M','2009-01-13 00:00:00',97,68,1,'1D784088-DACB-4185-9F60-3D2DB4925BA5','2014-06-30 00:00:00',114,32120,'London'),
    (115,563680513,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1991-05-31 00:00:00','S','F','2009-01-20 00:00:00',92,66,1,'4958E1C3-C872-4222-954E-09D2060EA7EF','2014-06-30 00:00:00',115,32120,'Birmingham '),
    (116,398737566,5,'Software Engineer','Engineering','Engineering ','1974-05-03 00:00:00','S','M','2009-01-31 00:00:00',98,69,1,'C6EB2566-CF28-4602-9A25-5B91C8728838','2014-06-30 00:00:00',116,32120,'Belfast '),
    (117,599942664,5,' Data Analyst','Analysis & Data Architecture ','Data & AI','1990-08-04 00:00:00','M','M','2009-02-18 00:00:00',99,69,1,'83A32D4C-4725-478F-9997-91739BB957BA','2014-06-30 00:00:00',117,32120,'Gdansk'),
    (118,222400012,5,'Software Engineer','Engineering','Engineering ','1971-06-13 00:00:00','M','M','2009-02-13 00:00:00',88,64,1,'E720053D-922E-4C91-B81A-A1CA4EF8BB0E','2014-06-30 00:00:00',118,32120,'London'),
    (119,334834274,5,'Data Engineer','Data Engineering','Data & AI','1989-06-15 00:00:00','S','M','2009-02-25 00:00:00',94,67,1,'EB27C026-9470-4450-8D5E-1F38A41793B5','2014-06-30 00:00:00',119,32120,'Birmingham '),
    (120,211789056,4,'Senior Software Engineer','Engineering','Engineering ','1987-06-06 00:00:00','S','F','2009-03-04 00:00:00',89,64,1,'49A05524-FA34-45B1-95BC-489901DC5B50','2014-06-30 00:00:00',120,32120,'Belfast '),
    (28,14417807,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1988-03-13 00:00:00','M','M','2006-06-30 00:00:00',21,30,1,'AAE1D04A-C237-4974-B4D5-935247737718','2014-06-30 00:00:00',28,36354,'Gdansk'),
    (29,948320468,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1979-09-25 00:00:00','S','M','2009-01-23 00:00:00',19,29,1,'CDB2C6DF-93E5-4558-91C8-424D5E7C658B','2014-06-30 00:00:00',29,36354,'London'),
    (30,410742000,4,'Senior Software Engineer','Engineering','Engineering ','1989-09-28 00:00:00','M','F','2009-01-29 00:00:00',14,27,1,'FC12677F-42F8-4790-AD69-685088ED7E5F','2014-06-30 00:00:00',30,36354,'Birmingham '),
    (31,750246141,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1986-05-20 00:00:00','M','F','2009-01-04 00:00:00',18,29,1,'352D6E2F-655B-49A2-9FEC-EFD7D8CD0D30','2014-06-30 00:00:00',31,36354,'Belfast '),
    (32,330211482,4,'Senior Software Engineer','Engineering','Engineering ','1977-07-10 00:00:00','M','F','2008-12-29 00:00:00',23,31,1,'BDADEB5C-A596-4DA1-88BA-842C7A0CC10F','2014-06-30 00:00:00',32,36354,'Gdansk'),
    (33,801758002,4,'Senior Data Engineer','Data Engineering','Data & AI','1976-12-26 00:00:00','M','M','2008-12-17 00:00:00',17,28,1,'51FDE6AC-BD50-467C-90E5-10CA7310455C','2014-06-30 00:00:00',33,36354,'London'),
    (34,754372876,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1987-06-10 00:00:00','M','F','2009-02-16 00:00:00',15,27,1,'6ADBD932-0DA5-4F5C-AF67-8E3A53630896','2014-06-30 00:00:00',34,36354,'Birmingham '),
    (35,999440576,4,'Senior Data Engineer','Data Engineering','Data & AI','1977-01-10 00:00:00','M','M','2009-02-08 00:00:00',22,31,1,'CA5D1935-44E2-4C45-93BB-809E59F56796','2014-06-30 00:00:00',35,36354,'Belfast '),
    (36,788456780,4,'Senior Software Engineer','Engineering','Engineering ','1984-07-31 00:00:00','M','M','2009-02-10 00:00:00',20,30,1,'9E912556-88BA-41EE-B946-CB84AB4C1102','2014-06-30 00:00:00',36,36354,'Gdansk'),
    (37,442121106,4,'Senior Data Engineer','Data Engineering','Data & AI','1986-08-07 00:00:00','S','M','2009-03-07 00:00:00',16,28,1,'77B384C7-AFFB-4816-992B-F5B3034EE4FF','2014-06-30 00:00:00',37,36354,'London'),
    (38,6298838,4,'Senior Software Engineer','Engineering','Engineering ','1966-12-14 00:00:00','M','F','2010-01-16 00:00:00',24,32,1,'891C27F4-28CC-44BB-BEA3-DA5EA7FBE957','2014-06-30 00:00:00',38,36354,'Birmingham '),
    (39,461786517,4,'Senior Data Engineer','Data Engineering','Data & AI','1971-09-11 00:00:00','S','M','2010-02-05 00:00:00',25,32,1,'8EF22FB3-AF37-4B44-8862-D60A7CB09D82','2014-06-30 00:00:00',39,36354,'Belfast '),
    (41,458159238,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1973-08-27 00:00:00','S','M','2009-01-21 00:00:00',35,37,1,'4652D4E4-6A27-47ED-9F51-C377E293DA28','2014-06-30 00:00:00',41,36354,'Gdansk'),
    (42,339712426,4,'Senior Data Engineer','Data Engineering','Data & AI','1984-07-25 00:00:00','M','M','2008-12-27 00:00:00',39,39,1,'82E52D5A-165B-4C6D-9773-C3A6B6332ECD','2014-06-30 00:00:00',42,36354,'London'),
    (43,693325305,4,'Senior Software Engineer','Engineering','Engineering ','1988-11-19 00:00:00','M','F','2009-01-02 00:00:00',34,37,1,'6B7EB306-9A00-496A-98A9-4E94FE72F77C','2014-06-30 00:00:00',43,36354,'Birmingham '),
    (44,276751903,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1990-05-17 00:00:00','S','M','2008-12-08 00:00:00',38,39,1,'F734D38A-56B5-471E-8DED-A682E958A9B3','2014-06-30 00:00:00',44,36354,'Belfast '),
    (45,500412746,4,'Senior Software Engineer','Engineering','Engineering ','1986-01-10 00:00:00','M','M','2009-02-26 00:00:00',37,38,1,'8FF3AF67-32F2-4A08-98C3-A40F842D41A3','2014-06-30 00:00:00',45,36354,'Gdansk'),
    (46,66073987,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1976-02-10 00:00:00','S','M','2009-02-08 00:00:00',36,38,1,'33543B35-77DA-4600-A41B-1EAFEA0AD643','2014-06-30 00:00:00',46,36354,'London'),
    (63,414476027,4,'Senior Data Engineer','Data Engineering','Data & AI','1955-01-30 00:00:00','S','M','2010-01-29 00:00:00',30,35,1,'3229D93F-6A14-4BAC-ABC5-A91B9ECFB4D3','2014-06-30 00:00:00',63,36354,'Birmingham '),
    (64,582347317,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1973-09-05 00:00:00','S','M','2010-02-23 00:00:00',26,33,1,'492B24BD-BDE9-4371-B96E-CCD72264B91F','2014-06-30 00:00:00',64,36354,'Belfast '),
    (65,8066363,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1970-04-28 00:00:00','M','M','2010-02-23 00:00:00',29,34,1,'9A08108D-E039-4862-8F93-55F18017AD72','2014-06-30 00:00:00',65,36354,'Gdansk'),
    (66,834186596,4,'Senior Software Engineer','Engineering','Engineering ','1970-03-07 00:00:00','S','M','2009-12-22 00:00:00',28,34,1,'08B1BA74-DD80-4FDA-8327-93268B84977B','2014-06-30 00:00:00',66,36354,'London'),
    (67,63179277,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1976-02-11 00:00:00','S','M','2009-03-05 00:00:00',32,36,1,'18187809-5294-474F-85A1-D5BE6BD518D6','2014-06-30 00:00:00',67,36354,'Birmingham '),
    (68,537092325,4,'Senior Software Engineer','Engineering','Engineering ','1971-09-02 00:00:00','S','M','2009-12-03 00:00:00',27,33,1,'CDC11292-DF74-4FB0-8676-5B2AA4687142','2014-06-30 00:00:00',68,36354,'Belfast '),
    (69,752513276,4,'Senior Data Engineer','Data Engineering','Data & AI','1991-04-06 00:00:00','S','M','2009-02-15 00:00:00',31,35,1,'12F678D7-EAD3-4CF4-8518-A19AACF2A6D4','2014-06-30 00:00:00',69,36354,'Gdansk'),
    (70,36151748,4,'Senior Software Engineer','Engineering','Engineering ','1984-12-29 00:00:00','M','M','2008-12-15 00:00:00',33,36,1,'FC617BB8-D2A3-4374-873C-8EF38D80127D','2014-06-30 00:00:00',70,36354,'London'),
    (260,437296311,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1978-01-29 00:00:00','M','F','2010-12-06 00:00:00',50,45,1,'9E03395F-4D5D-4A53-880E-174BD8C1DB59','2014-06-30 00:00:00',260,37230,'Birmingham '),
    (261,280633567,4,'Senior Software Engineer','Engineering','Engineering ','1978-01-17 00:00:00','M','M','2010-12-25 00:00:00',51,45,1,'9825EB00-8E36-4506-93A2-6DDCDC0B13C3','2014-06-30 00:00:00',261,37230,'Belfast '),
    (48,690627818,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1956-06-04 00:00:00','M','F','2008-01-06 00:00:00',83,61,1,'3E3B6905-209E-442E-B8A8-9A0980241C6A','2014-06-30 00:00:00',48,39274,'Gdansk'),
    (49,912265825,4,'Senior Data Engineer','Data Engineering','Data & AI','1956-03-26 00:00:00','S','M','2008-01-07 00:00:00',88,64,1,'756A60AE-378F-43D8-9F93-1E821D1EAF52','2014-06-30 00:00:00',49,39274,'London'),
    (50,844973625,4,'Senior Software Engineer','Engineering','Engineering ','1956-08-30 00:00:00','M','M','2008-02-02 00:00:00',84,62,1,'40D603D9-7F99-48B7-A580-B17CF429BED2','2014-06-30 00:00:00',50,39274,'Birmingham '),
    (51,132674823,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1956-07-11 00:00:00','S','M','2008-02-20 00:00:00',85,62,1,'6E086F41-B81D-4BDC-9F13-0EEC488DC43E','2014-06-30 00:00:00',51,39274,'Belfast '),
    (52,565090917,4,'Senior Software Engineer','Engineering','Engineering ','1956-04-04 00:00:00','M','F','2008-03-10 00:00:00',86,63,1,'692B8826-03B4-4C3B-82FC-1FC6F1409689','2014-06-30 00:00:00',52,39274,'Gdansk'),
    (53,9659517,4,'Senior Data Engineer','Data Engineering','Data & AI','1956-03-29 00:00:00','M','F','2008-03-28 00:00:00',87,63,1,'C334B2D2-0C56-4906-9095-F1D07A98CBEC','2014-06-30 00:00:00',53,39274,'London'),
    (54,109272464,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1986-09-10 00:00:00','M','F','2010-01-01 00:00:00',89,64,1,'E950A52A-DF61-4FEC-9063-545664D65B89','2014-06-30 00:00:00',54,39274,'Birmingham '),
    (88,294148271,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1966-12-17 00:00:00','S','F','2009-12-18 00:00:00',99,69,1,'EBCDBA1C-6C1D-4D36-90F7-1893755C85E3','2014-06-30 00:00:00',88,39274,'Belfast '),
    (89,90888098,4,'Senior Software Engineer','Engineering','Engineering ','1986-09-10 00:00:00','S','M','2010-02-01 00:00:00',96,68,1,'D5FBE9E6-B8C5-484C-B4B8-48059E0EF267','2014-06-30 00:00:00',89,39274,'Gdansk'),
    (90,82638150,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1986-09-07 00:00:00','S','F','2010-02-20 00:00:00',97,68,1,'BB886159-1400-4264-B7C9-A3769BEB1274','2014-06-30 00:00:00',90,39274,'London'),
    (91,390124815,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1986-09-13 00:00:00','S','F','2010-01-12 00:00:00',95,67,1,'CE256B6C-1EEE-43ED-9969-7CAC480FF4D7','2014-06-30 00:00:00',91,39274,'Birmingham '),
    (92,826454897,4,'Senior Data Engineer','Data Engineering','Data & AI','1986-10-01 00:00:00','M','M','2010-03-10 00:00:00',98,69,1,'B3BF7FC5-2014-48CE-B7BB-76124FA8446C','2014-06-30 00:00:00',92,39274,'Belfast '),
    (103,455563743,4,'Senior Software Engineer','Engineering','Engineering ','1986-09-22 00:00:00','S','M','2009-12-06 00:00:00',93,66,1,'6C25A32B-88B5-4F84-A129-F7F688DFA588','2014-06-30 00:00:00',103,39274,'Gdansk'),
    (104,717889520,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1986-09-19 00:00:00','M','F','2009-12-25 00:00:00',94,67,1,'6DC9F7D0-5664-4E4A-90F5-7AB85EBB02E6','2014-06-30 00:00:00',104,39274,'London'),
    (105,801365500,4,'Senior Software Engineer','Engineering','Engineering ','1986-09-19 00:00:00','S','M','2009-12-25 00:00:00',90,65,1,'8B21E53D-E705-479A-B32E-6E63AC2F4BCD','2014-06-30 00:00:00',105,39274,'Birmingham '),
    (106,561196580,4,'Senior Data Engineer','Data Engineering','Data & AI','1986-09-28 00:00:00','S','M','2010-02-27 00:00:00',92,66,1,'D4CF23D9-21B6-45E4-827C-22890DF0373B','2014-06-30 00:00:00',106,39274,'Belfast '),
    (107,393421437,4,'Senior Software Engineer','Engineering','Engineering ','1986-10-01 00:00:00','M','M','2010-02-08 00:00:00',91,65,1,'F71C6055-557B-4660-86FF-8C0FA14B24E6','2014-06-30 00:00:00',107,39274,'Gdansk'),
    (17,253022876,2,'Solution Architect','Engineering','Engineering ','1987-05-03 00:00:00','S','M','2007-01-26 00:00:00',42,41,1,'1B480240-95C0-410F-A717-EB29943C8886','2014-06-30 00:00:00',17,39307.58,'London'),
    (19,52541318,2,'Test Architect','Testing and Quality Assurance','Engineering ','1978-01-29 00:00:00','S','F','2011-02-14 00:00:00',43,41,1,'1F6DA901-C7F7-48A8-8EEF-D81868D72B52','2014-06-30 00:00:00',19,39307.58,'Birmingham '),
    (20,323403273,2,'Data Solution Architect','Data Engineering','Data & AI','1975-03-17 00:00:00','M','F','2011-01-07 00:00:00',41,40,1,'43CCA446-DA1C-454C-8530-873AD2923E1B','2014-06-30 00:00:00',20,39307.58,'Belfast '),
    (262,231203233,2,'Solution Architect','Engineering','Engineering ','1964-06-21 00:00:00','S','M','2009-01-12 00:00:00',56,48,1,'BE81FD77-428C-449F-AB79-48B1CDF53D6A','2014-06-30 00:00:00',262,39307.58,'Gdansk'),
    (224,621209647,3,'Lead Software Engineer','Engineering','Engineering ','1981-11-06 00:00:00','M','M','2009-01-07 00:00:00',45,42,1,'1A68CD62-6FE9-4613-90D4-2CD178E4E54A','2014-06-30 00:00:00',224,39420,'London'),
    (236,476980013,3,'Lead Data Engineer','Data Engineering','Data & AI','1976-04-16 00:00:00','S','M','2009-02-25 00:00:00',53,46,1,'4511ABBA-7F34-400E-907B-A663C20E1A41','2014-06-30 00:00:00',236,40711.516,'Birmingham '),
    (237,416679555,3,'Lead Software Engineer','Engineering','Engineering ','1977-04-17 00:00:00','S','M','2009-02-06 00:00:00',52,46,1,'FD53C4C8-B34E-460F-9EE5-747B07FE98B3','2014-06-30 00:00:00',237,40711.516,'Belfast '),
    (135,964089218,4,'Senior Software Engineer','Engineering','Engineering ','1982-01-03 00:00:00','M','M','2008-12-04 00:00:00',9,24,1,'D83A26F3-7EA7-477B-A5BB-7EAADFC13A09','2014-06-30 00:00:00',135,40880,'Gdansk'),
    (136,701156975,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1970-11-12 00:00:00','M','M','2009-12-11 00:00:00',4,22,1,'D9C43D08-3882-4E5C-BDF0-F6BD7004CD04','2014-06-30 00:00:00',136,40880,'London'),
    (137,63761469,4,'Senior Software Engineer','Engineering','Engineering ','1974-09-05 00:00:00','S','F','2009-02-23 00:00:00',8,24,1,'BC18A829-F0CE-4EAF-9785-2D84C86F925A','2014-06-30 00:00:00',137,40880,'Birmingham '),
    (138,25011600,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1987-11-22 00:00:00','M','F','2009-02-04 00:00:00',7,23,1,'1629EDDD-D0AE-4CB9-A59C-3A175F7027E5','2014-06-30 00:00:00',138,40880,'Belfast '),
    (139,113393530,4,'Senior Software Engineer','Engineering','Engineering ','1971-10-23 00:00:00','S','M','2010-01-06 00:00:00',0,20,1,'065D8D5F-9504-4FFE-98DC-E69677F19F15','2014-06-30 00:00:00',139,40880,'Gdansk'),
    (140,339233463,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1953-04-30 00:00:00','M','M','2010-01-22 00:00:00',5,22,1,'72ED240A-0FD8-4423-8A49-9078BA6BCF6C','2014-06-30 00:00:00',140,40880,'London'),
    (141,872923042,4,'Senior Software Engineer','Engineering','Engineering ','1974-09-10 00:00:00','M','M','2010-01-24 00:00:00',1,20,1,'CC75C35D-1566-43FA-B2E9-D1E508EFDCD1','2014-06-30 00:00:00',141,40880,'Birmingham '),
    (142,163347032,4,'Senior Data Engineer','Data Engineering','Data & AI','1970-04-04 00:00:00','S','F','2010-03-04 00:00:00',3,21,1,'6456CEC3-9B1E-4EBC-9FD8-732B93363F65','2014-06-30 00:00:00',142,40880,'Belfast '),
    (143,56772045,4,'Senior Software Engineer','Engineering','Engineering ','1971-09-05 00:00:00','S','M','2010-02-13 00:00:00',2,21,1,'42A506A5-0AC0-4148-B702-BB7B804EF98C','2014-06-30 00:00:00',143,40880,'Gdansk'),
    (144,886023130,4,'Senior Data Engineer','Data Engineering','Data & AI','1990-11-04 00:00:00','M','M','2009-01-17 00:00:00',6,23,1,'DC5BA622-B860-41EE-AF92-5FEB4779B589','2014-06-30 00:00:00',144,40880,'London'),
    (153,568596888,4,'Senior Software Engineer','Engineering','Engineering ','1974-10-16 00:00:00','S','M','2008-12-16 00:00:00',15,27,1,'618B71BC-6E8C-492D-8862-B9EFB7A4E06A','2014-06-30 00:00:00',153,40880,'Birmingham '),
    (154,97728960,4,'Senior Data Engineer','Data Engineering','Data & AI','1967-03-02 00:00:00','M','M','2008-12-23 00:00:00',10,25,1,'9F01E1FB-B893-40CC-9F5C-AAF89F9B7AF5','2014-06-30 00:00:00',154,40880,'Belfast '),
    (155,212801092,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1989-02-15 00:00:00','S','M','2009-01-04 00:00:00',16,28,1,'9923376F-26D0-4845-9D99-CC3D696CAEB8','2014-06-30 00:00:00',155,40880,'Gdansk'),
    (156,322160340,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1974-09-23 00:00:00','M','M','2009-01-11 00:00:00',11,25,1,'042427B8-3883-4A87-A6A3-724EE1690F49','2014-06-30 00:00:00',156,40880,'London'),
    (157,812797414,4,'Senior Software Engineer','Engineering','Engineering ','1977-10-05 00:00:00','S','F','2009-02-03 00:00:00',12,26,1,'F963F913-449E-4EBB-BFDA-FC0C3010DB65','2014-06-30 00:00:00',157,40880,'Birmingham '),
    (158,300946911,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1986-12-08 00:00:00','S','F','2009-03-07 00:00:00',14,27,1,'13942056-2930-4490-83CE-AF2386D5A5E7','2014-06-30 00:00:00',158,40880,'Belfast '),
    (159,404159499,4,'Senior Software Engineer','Engineering','Engineering ','1984-12-08 00:00:00','S','M','2009-02-16 00:00:00',13,26,1,'4DA76442-5EEF-41FB-AE19-16C55714F9AD','2014-06-30 00:00:00',159,40880,'Gdansk'),
    (181,545337468,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1984-11-17 00:00:00','S','M','2008-12-09 00:00:00',20,30,1,'4FD6FE82-535A-4DD1-BEB1-154A8B5E42F0','2014-06-30 00:00:00',181,40880,'London'),
    (182,368920189,4,'Senior Software Engineer','Engineering','Engineering ','1986-12-01 00:00:00','S','M','2008-12-28 00:00:00',21,30,1,'EBBC6787-3F2D-4F6B-9EA3-4DEF02EF382E','2014-06-30 00:00:00',182,40880,'Birmingham '),
    (183,969985265,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1979-07-02 00:00:00','M','F','2009-01-22 00:00:00',17,28,1,'045C9CBB-3448-4599-9FA9-6C7A9F82F832','2014-06-30 00:00:00',183,40880,'Belfast '),
    (184,305522471,4,'Senior Software Engineer','Engineering','Engineering ','1986-04-05 00:00:00','M','M','2009-02-09 00:00:00',18,29,1,'BAB69951-28AD-4BCA-B5AC-032746D0CC6F','2014-06-30 00:00:00',184,40880,'Gdansk'),
    (185,621932914,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1975-12-21 00:00:00','S','M','2009-02-28 00:00:00',19,29,1,'B9EEBF9F-F694-4BC2-98EC-9B4FB0379EDF','2014-06-30 00:00:00',185,40880,'London'),
    (18,222969461,2,'Data Solution Architect','Data Engineering','Data & AI','1978-03-06 00:00:00','S','M','2011-02-07 00:00:00',48,44,1,'64730415-1F58-4E5B-8FA8-5E4DAEBA53B4','2014-06-30 00:00:00',18,42115.452,'Birmingham '),
    (21,243322160,2,'Test Architect','Testing and Quality Assurance','Engineering ','1986-02-04 00:00:00','M','M','2009-03-02 00:00:00',44,42,1,'AD0D7626-4506-45C4-898F-9D7A0E13AABD','2014-06-30 00:00:00',21,42115.452,'Belfast '),
    (22,95958330,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1987-05-21 00:00:00','S','M','2008-12-12 00:00:00',45,42,1,'AF21F1B7-0691-48AD-B325-B8F2D7B2268A','2014-06-30 00:00:00',22,42115.452,'Gdansk'),
    (23,767955365,2,'Solution Architect','Engineering','Engineering ','1962-09-13 00:00:00','M','F','2009-01-12 00:00:00',46,43,1,'90899830-127E-4876-85CA-7F6E03025281','2014-06-30 00:00:00',23,42115.452,'London'),
    (24,72636981,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1979-06-18 00:00:00','M','F','2009-01-18 00:00:00',47,43,1,'53575C58-FBA1-4C1A-B8FF-95E050B44393','2014-06-30 00:00:00',24,42115.452,'Birmingham '),
    (79,697712387,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1966-12-08 00:00:00','M','M','2010-01-24 00:00:00',60,50,1,'55F62E38-9457-46C8-A824-E46A3117A935','2014-06-30 00:00:00',79,43800,'Belfast '),
    (80,943170460,4,'Senior Software Engineer','Engineering','Engineering ','1970-12-03 00:00:00','S','M','2010-01-17 00:00:00',65,52,1,'606C21E2-3EC0-48A6-A9FE-6BC8123AC786','2014-06-30 00:00:00',80,43800,'Gdansk'),
    (81,413787783,4,'Senior Data Engineer','Data Engineering','Data & AI','1971-03-09 00:00:00','S','M','2009-12-29 00:00:00',64,52,1,'03A9BA14-0D5B-4671-B851-2C1721EFBF01','2014-06-30 00:00:00',81,43800,'London'),
    (82,58791499,4,'Senior Software Engineer','Engineering','Engineering ','1973-08-29 00:00:00','S','M','2010-03-03 00:00:00',62,51,1,'D308D387-F7F3-4B5F-ABDA-FAF5574245CD','2014-06-30 00:00:00',82,43800,'Birmingham '),
    (83,988315686,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1973-12-23 00:00:00','M','M','2010-02-12 00:00:00',61,50,1,'296C52AE-169F-4292-975D-C508476DCECF','2014-06-30 00:00:00',83,43800,'Belfast '),
    (84,947029962,4,'Senior Software Engineer','Engineering','Engineering ','1952-03-02 00:00:00','M','M','2010-02-05 00:00:00',66,53,1,'9AF24ACC-EA3E-4EFE-B5E3-4762C496D57C','2014-06-30 00:00:00',84,43800,'Gdansk'),
    (85,1662732,4,'Senior Data Engineer','Data Engineering','Data & AI','1970-12-23 00:00:00','S','M','2009-12-11 00:00:00',63,51,1,'C294F676-CAAF-4924-9730-BC81AE408BE1','2014-06-30 00:00:00',85,43800,'London'),
    (86,769680433,4,'Senior Software Engineer','Engineering','Engineering ','1972-06-13 00:00:00','M','M','2009-01-05 00:00:00',59,49,1,'10E5BD6F-2B9C-4192-A94D-6A2D50EA1ADB','2014-06-30 00:00:00',86,43800,'Birmingham '),
    (128,384162788,4,'Senior Software Engineer','Engineering','Engineering ','1980-11-13 00:00:00','S','M','2008-12-04 00:00:00',68,54,1,'0217049E-1566-42B6-8027-41B751E2B00B','2014-06-30 00:00:00',128,43800,'Belfast '),
    (129,502058701,4,'Senior Data Engineer','Data Engineering','Data & AI','1988-05-16 00:00:00','S','M','2008-12-22 00:00:00',69,54,1,'A03D6052-1F85-4EBE-AAC9-B67CFDCD91A6','2014-06-30 00:00:00',129,43800,'Gdansk'),
    (130,578953538,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1973-08-04 00:00:00','S','M','2009-02-13 00:00:00',71,55,1,'54FDA597-6822-42B4-B128-63ECA03071F2','2014-06-30 00:00:00',130,43800,'London'),
    (131,273260055,4,'Senior Data Engineer','Data Engineering','Data & AI','1990-10-07 00:00:00','S','M','2009-02-15 00:00:00',72,56,1,'232D68BF-DF58-48F9-9235-53BD4B009B4B','2014-06-30 00:00:00',131,43800,'Birmingham '),
    (132,1300049,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1986-04-09 00:00:00','M','F','2009-02-22 00:00:00',67,53,1,'15671E3B-016F-41FD-840B-5A9F7D776D9A','2014-06-30 00:00:00',132,43800,'Belfast '),
    (133,830150469,4,'Senior Data Engineer','Data Engineering','Data & AI','1991-01-04 00:00:00','S','M','2009-01-10 00:00:00',70,55,1,'416BF905-7D6C-4692-8FD6-40F6C4F9ECC4','2014-06-30 00:00:00',133,43800,'Gdansk'),
    (193,761597760,4,'Senior Data Engineer','Data Engineering','Data & AI','1988-12-05 00:00:00','S','M','2008-12-06 00:00:00',52,46,1,'8C7321D2-2C64-4902-9D64-8F5C1EB7F747','2014-06-30 00:00:00',193,43800,'London'),
    (194,295971920,4,'Senior Software Engineer','Engineering','Engineering ','1989-06-25 00:00:00','S','M','2008-12-12 00:00:00',47,43,1,'45358AE8-0B0E-4C11-90BB-DAC3EC0D5C82','2014-06-30 00:00:00',194,43800,'Birmingham '),
    (195,918737118,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1985-12-25 00:00:00','S','M','2008-12-17 00:00:00',58,49,1,'DC7E95FF-275E-41C2-8ED3-686864F0540A','2014-06-30 00:00:00',195,43800,'Belfast '),
    (196,370487086,4,'Senior Software Engineer','Engineering','Engineering ','1980-10-04 00:00:00','M','M','2008-12-24 00:00:00',53,46,1,'9BEF0C94-7969-4905-9A42-CE469C754800','2014-06-30 00:00:00',196,43800,'Gdansk'),
    (197,632092621,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1977-10-04 00:00:00','M','M','2008-12-31 00:00:00',48,44,1,'ACA7B40C-7AC0-4DAA-B4C7-1051D850D7D9','2014-06-30 00:00:00',197,43800,'London'),
    (198,19312190,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1988-11-26 00:00:00','M','F','2009-01-04 00:00:00',49,44,1,'A63966B6-9AD6-40BC-AFD4-A83745879F4D','2014-06-30 00:00:00',198,43800,'Birmingham '),
    (199,992874797,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1987-02-10 00:00:00','M','F','2009-01-12 00:00:00',54,47,1,'5DD2BE46-204F-4AF3-91F5-5EF082F6D6A6','2014-06-30 00:00:00',199,43800,'Belfast '),
    (200,749211824,4,'Senior Software Engineer','Engineering','Engineering ','1987-09-06 00:00:00','M','M','2009-01-17 00:00:00',56,48,1,'DD9AD278-ED17-40CF-8619-BAF1BB9D1CF2','2014-06-30 00:00:00',200,43800,'Gdansk'),
    (201,746201340,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1977-02-10 00:00:00','S','M','2009-01-29 00:00:00',55,47,1,'18D594A8-B4ED-43C0-9C43-6033FEAADF4E','2014-06-30 00:00:00',201,43800,'London'),
    (202,436757988,4,'Senior Software Engineer','Engineering','Engineering ','1989-11-10 00:00:00','S','M','2009-02-05 00:00:00',50,45,1,'BB4A3E50-232E-4212-9FAF-E67429FEBC7D','2014-06-30 00:00:00',202,43800,'Birmingham '),
    (203,693168613,4,'Senior Data Engineer','Data Engineering','Data & AI','1981-05-28 00:00:00','M','M','2009-02-24 00:00:00',51,45,1,'699C00D8-C4AB-4CD2-A48F-37CBCB5BFCCA','2014-06-30 00:00:00',203,43800,'Belfast '),
    (204,440379437,4,'Senior Software Engineer','Engineering','Engineering ','1988-05-10 00:00:00','M','M','2009-03-08 00:00:00',57,48,1,'790C9A7C-264C-4D48-A9D3-E2571A8011D8','2014-06-30 00:00:00',204,43800,'Gdansk'),
    (223,981495526,3,'Lead Software Engineer','Engineering','Engineering ','1987-12-22 00:00:00','M','M','2009-01-26 00:00:00',46,43,1,'4D36A720-CE32-4C47-866A-DB7844449309','2014-06-30 00:00:00',223,46720,'London'),
    (224,621209647,3,'Lead Data Engineer','Data Engineering','Data & AI','1981-11-06 00:00:00','M','M','2009-01-07 00:00:00',45,42,1,'1A68CD62-6FE9-4613-90D4-2CD178E4E54A','2014-06-30 00:00:00',224,46720,'Birmingham '),
    (225,470689086,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1984-03-29 00:00:00','M','M','2009-02-13 00:00:00',47,43,1,'DE321854-B076-4D59-BB7B-42152031B108','2014-06-30 00:00:00',225,46720,'Belfast '),
    (226,368691270,3,'Lead Data Engineer','Data Engineering','Data & AI','1984-08-11 00:00:00','M','M','2009-03-03 00:00:00',48,44,1,'DFA02733-C26E-4E31-99D8-9167E4E5131D','2014-06-30 00:00:00',226,46720,'Gdansk'),
    (239,619308550,3,'Lead Software Engineer','Engineering','Engineering ','1984-11-20 00:00:00','M','F','2008-12-25 00:00:00',51,45,1,'834D7AB6-06E6-4944-B42F-028CD4BD388E','2014-06-30 00:00:00',239,48432.58,'London'),
    (218,540688287,4,'Senior Software Engineer','Engineering','Engineering ','1990-04-28 00:00:00','S','M','2008-12-16 00:00:00',76,58,1,'C609B3B2-7969-410C-934C-62C34B63C4EE','2014-06-30 00:00:00',218,49134.548,'Birmingham '),
    (221,260805477,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1987-05-26 00:00:00','M','M','2009-03-06 00:00:00',75,57,1,'45C358FB-9C7F-4D36-8EC7-3D89E9FD07F4','2014-06-30 00:00:00',221,49134.548,'Belfast '),
    (217,345106466,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1976-01-30 00:00:00','M','M','2009-01-04 00:00:00',77,58,1,'DC60EEED-9F9F-4435-8666-4DE4FAFDE9C3','2014-06-30 00:00:00',217,51942.42,'Gdansk'),
    (238,264306399,3,'Lead Data Engineer','Data Engineering','Data & AI','1984-08-01 00:00:00','S','M','2009-01-01 00:00:00',50,45,1,'47E76B59-B137-4572-AD55-6B3E68C13BD3','2014-06-30 00:00:00',238,53346.064,'London'),
    (240,332040978,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1978-07-18 00:00:00','S','M','2008-12-13 00:00:00',49,44,1,'A1D86ECC-EA17-4B1B-8369-F1D07AB0A469','2014-06-30 00:00:00',240,53346.064,'Birmingham '),
    (251,603686790,4,'Senior Software Engineer','Engineering','Engineering ','1984-08-17 00:00:00','S','M','2009-02-10 00:00:00',59,49,1,'D0FD55FF-42FA-491E-8B3B-AB3316018909','2014-06-30 00:00:00',251,53346.064,'Belfast '),
    (252,792847334,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1974-08-21 00:00:00','M','M','2009-02-28 00:00:00',60,50,1,'51DE26F0-6ED9-4A70-B689-88EB882674B6','2014-06-30 00:00:00',252,53346.064,'Gdansk'),
    (253,407505660,4,'Senior Software Engineer','Engineering','Engineering ','1970-11-30 00:00:00','M','F','2009-12-17 00:00:00',56,48,1,'ED06F9F4-2123-4C44-89D7-E43E1E1ABC2F','2014-06-30 00:00:00',253,53346.064,'London'),
    (254,482810518,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1970-11-24 00:00:00','M','M','2010-01-04 00:00:00',57,48,1,'36CD6636-C657-4FC7-9BFA-CC1BFA9102A2','2014-06-30 00:00:00',254,53346.064,'Birmingham '),
    (255,466142721,4,'Senior Test Engineer','Testing and Quality Assurance','Engineering ','1966-11-29 00:00:00','M','M','2010-01-11 00:00:00',52,46,1,'2CB2D5C3-C437-49B1-9FFD-FAA096F6126F','2014-06-30 00:00:00',255,53346.064,'Belfast '),
    (256,367453993,4,'Senior Data Engineer','Data Engineering','Data & AI','1952-05-12 00:00:00','M','M','2010-01-23 00:00:00',58,49,1,'0423D8D0-1B14-4718-8C17-85E2F98D222F','2014-06-30 00:00:00',256,53346.064,'Gdansk'),
    (257,381073001,4,'Senior Software Engineer','Engineering','Engineering ','1972-09-17 00:00:00','S','M','2010-01-27 00:00:00',54,47,1,'A28AB377-06F5-417A-A5E2-59F459088699','2014-06-30 00:00:00',257,53346.064,'London'),
    (258,785853949,4,'Senior Data Engineer','Analysis & Data Architecture ','Data & AI','1971-01-04 00:00:00','S','F','2010-01-31 00:00:00',53,46,1,'B60712A9-50A5-4296-B892-69C4701834B0','2014-06-30 00:00:00',258,53346.064,'Birmingham '),
    (259,20269531,4,'Senior Software Engineer','Engineering','Engineering ','1973-06-03 00:00:00','M','M','2010-03-09 00:00:00',55,47,1,'B9641CAE-765C-4662-B760-C167A1F2B8B5','2014-06-30 00:00:00',259,53346.064,'Belfast '),
    (242,363923697,3,'Lead Software Engineer','Engineering','Engineering ','1976-03-06 00:00:00','M','F','2008-12-18 00:00:00',60,50,1,'09F75454-028C-46CA-BC08-0147BD0220D7','2014-06-30 00:00:00',242,55480,'Gdansk'),
    (243,60517918,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1976-02-23 00:00:00','S','F','2009-01-06 00:00:00',61,50,1,'9E9F713B-707C-4F7E-9504-DE188052A045','2014-06-30 00:00:00',243,55480,'London'),
    (244,931190412,3,'Lead Software Engineer','Engineering','Engineering ','1984-09-20 00:00:00','S','M','2009-01-24 00:00:00',62,51,1,'CB3E71EC-A381-4716-87DF-D3841AB9795A','2014-06-30 00:00:00',244,55480,'Birmingham '),
    (246,663843431,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1977-02-14 00:00:00','M','M','2009-02-11 00:00:00',63,51,1,'51C54D34-064B-44F7-A6B1-7702BD491980','2014-06-30 00:00:00',246,55480,'Belfast '),
    (247,519756660,3,'Lead Software Engineer','Engineering','Engineering ','1979-03-09 00:00:00','M','F','2009-03-01 00:00:00',64,52,1,'0C641D77-8675-493F-9947-8C65136559CD','2014-06-30 00:00:00',247,55480,'Gdansk'),
    (121,521265716,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1972-09-09 00:00:00','S','M','2009-01-02 00:00:00',93,66,1,'01BCCE22-D63A-4C3F-9BA8-D3D5A4C3BD52','2014-06-30 00:00:00',121,56153.936,'London'),
    (228,553069203,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1976-01-18 00:00:00','M','M','2008-12-14 00:00:00',92,66,1,'4611C7C5-90A0-407F-B054-93BD51533609','2014-06-30 00:00:00',228,59663.484,'Birmingham '),
    (212,885055826,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1976-03-18 00:00:00','M','M','2008-12-09 00:00:00',81,60,1,'E249D613-36C9-4544-9B6F-6CE50E5E0DA5','2014-06-30 00:00:00',212,63173.032,'Belfast '),
    (250,895209680,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1978-02-10 00:00:00','S','F','2011-02-25 00:00:00',49,44,1,'7D6B0155-0191-4599-8394-378EBDE63C9A','2014-06-30 00:00:00',250,65700,'Gdansk'),
    (275,841560125,3,'Lead Data Engineer','Data Engineering','Data & AI','1968-12-25 00:00:00','S','M','2011-05-31 00:00:00',38,39,1,'E19F8DE2-0F40-418C-84A2-DB48B98DC6A2','2014-06-30 00:00:00',275,67384.548,'London'),
    (276,191644724,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1980-02-27 00:00:00','M','F','2011-05-31 00:00:00',27,33,1,'4509F387-D73A-43DC-A502-B1C27AA1DC9E','2014-06-30 00:00:00',276,67384.548,'Birmingham '),
    (277,615389812,3,'Lead Data Engineer','Data Engineering','Data & AI','1962-08-29 00:00:00','S','F','2011-05-31 00:00:00',24,32,1,'A011C97B-081C-4739-996F-C1CAC4532F8D','2014-06-30 00:00:00',277,67384.548,'Belfast '),
    (278,234474252,3,'Lead Software Engineer','Engineering','Engineering ','1975-02-04 00:00:00','M','M','2011-05-31 00:00:00',33,36,1,'50EECC16-0D0D-43A9-9649-016C06DE8D78','2014-06-30 00:00:00',278,67384.548,'Gdansk'),
    (279,716374314,3,'Lead Data Engineer','Data Engineering','Data & AI','1974-01-18 00:00:00','M','M','2011-05-31 00:00:00',29,34,1,'BB510FCE-0105-4306-B591-6450D9EBF401','2014-06-30 00:00:00',279,67384.548,'Toronto'),
    (280,61161660,3,'Lead Software Engineer','Engineering','Engineering ','1974-12-06 00:00:00','S','F','2011-05-31 00:00:00',22,31,1,'7627B9D6-0707-4706-9AD9-0D37506B08AE','2014-06-30 00:00:00',280,67384.548,'Birmingham '),
    (281,139397894,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1968-03-09 00:00:00','M','M','2011-05-31 00:00:00',26,33,1,'4103C891-37E8-4DFC-AEAC-B55E2BC1BE1C','2014-06-30 00:00:00',281,67384.548,'Belfast '),
    (282,399771412,3,'Lead Software Engineer','Engineering','Engineering ','1963-12-11 00:00:00','M','M','2011-05-31 00:00:00',31,35,1,'FD3992FB-3067-451D-A09D-73BD53C0FECA','2014-06-30 00:00:00',282,67384.548,'Gdansk'),
    (283,987554265,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1974-02-11 00:00:00','S','M','2011-05-31 00:00:00',23,31,1,'1E8F9E91-508F-4D49-ACD2-775C836030ED','2014-06-30 00:00:00',283,67384.548,'London'),
    (284,90836195,3,'Lead Software Engineer','Engineering','Engineering ','1978-01-05 00:00:00','M','M','2012-09-30 00:00:00',39,39,1,'0C67CE00-DE78-4712-908F-06939A2C58D5','2014-06-30 00:00:00',284,67384.548,'Birmingham '),
    (286,758596752,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1977-02-14 00:00:00','S','F','2013-05-30 00:00:00',36,38,1,'4A9A8407-A680-4A6B-8D03-511CB58F9A8A','2014-06-30 00:00:00',286,67384.548,'Belfast '),
    (288,954276278,3,'Lead Software Engineer','Engineering','Engineering ','1975-07-09 00:00:00','S','F','2013-05-30 00:00:00',35,37,1,'B9BF7741-E0CA-4F37-ACDE-A4F78C6D03E9','2014-06-30 00:00:00',288,67384.548,'Gdansk'),
    (289,668991357,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1968-03-17 00:00:00','M','F','2012-05-30 00:00:00',37,38,1,'723A5921-D8A1-4659-9BC4-13C4CF7C9C91','2014-06-30 00:00:00',289,67384.548,'London'),
    (290,134219713,3,'Lead Software Engineer','Engineering','Engineering ','1975-09-30 00:00:00','S','M','2012-05-30 00:00:00',34,37,1,'604213F9-DD0F-43B4-BDD2-C96E93D3F4BF','2014-06-30 00:00:00',290,67384.548,'Birmingham '),
    (222,685233686,2,'Data Solution Architect','Data Engineering','Data & AI','1968-09-17 00:00:00','S','M','2008-12-12 00:00:00',44,42,1,'13909262-4136-492F-BCA3-0B0E3773B03E','2014-12-26 09:17:08.637000',222,68788.484,'Belfast '),
    (4,112457891,3,'Lead Software Engineer','Engineering','Engineering ','1974-12-23 00:00:00','S','M','2007-12-05 00:00:00',48,80,1,'59747955-87B8-443F-8ED4-F8AD3AFDF3A9','2014-06-30 00:00:00',4,69262.4,'Gdansk');
INSERT INTO Employee_Fact VALUES
    (16,24756624,1,'Principle Architect','Engineering','Engineering ','1975-03-19 00:00:00','S','M','2007-12-20 00:00:00',40,40,1,'E87029AA-2CBA-4C03-B948-D83AF0313E28','2014-06-30 00:00:00',16,70080,'London'),
    (227,141165819,2,'Solution Architect','Engineering','Engineering ','1971-02-18 00:00:00','M','M','2009-12-02 00:00:00',86,63,1,'62F6EC59-5635-44F3-9CC1-2D8EEAF90A05','2014-06-30 00:00:00',227,70192.42,'Birmingham '),
    (26,277173473,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1982-11-03 00:00:00','M','M','2008-12-01 00:00:00',43,41,1,'69D5D162-E817-45E7-9DEC-5D9B8310E7B1','2014-12-26 09:17:08.637000',26,71596.064,'Belfast '),
    (27,446466105,3,'Lead Software Engineer','Engineering','Engineering ','1956-10-08 00:00:00','S','F','2008-02-27 00:00:00',80,60,1,'83FFAAC6-B895-481F-B897-14F965D4DA47','2014-06-30 00:00:00',27,73000,'Toronto'),
    (40,309738752,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1956-01-16 00:00:00','S','F','2007-12-26 00:00:00',82,61,1,'2CC71B96-F421-485E-9832-8723337749BB','2014-06-30 00:00:00',40,73000,'London'),
    (47,33237992,3,'Lead Software Engineer','Engineering','Engineering ','1988-09-06 00:00:00','S','M','2009-02-22 00:00:00',65,52,1,'08365B05-C143-4260-A93C-6B69418B1946','2014-06-30 00:00:00',47,73000,'Birmingham '),
    (55,233069302,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1956-04-01 00:00:00','M','M','2008-02-08 00:00:00',79,59,1,'28F7EF89-2793-4989-B67D-25046543C1E3','2014-06-30 00:00:00',55,73000,'Belfast '),
    (62,494170342,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1956-08-07 00:00:00','M','M','2008-03-17 00:00:00',81,60,1,'D4ED1F78-7C28-479B-BFEF-A73228BA2AAA','2014-06-30 00:00:00',62,73000,'Gdansk'),
    (71,578935259,3,'Lead Data Engineer','Data Engineering','Data & AI','1989-01-29 00:00:00','S','M','2009-02-15 00:00:00',70,55,1,'1AD772D7-7B4A-4A7B-8676-49DD7608CB94','2014-06-30 00:00:00',71,73000,'London'),
    (78,370989364,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1987-08-27 00:00:00','M','M','2008-12-15 00:00:00',72,56,1,'71EEE2A6-B9B3-4BF4-8949-01239DF7C901','2014-06-30 00:00:00',78,73000,'Belfast '),
    (87,7201901,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1984-04-11 00:00:00','M','M','2008-12-22 00:00:00',67,53,1,'5BE16416-8570-417D-9E54-047DB468B5E9','2014-06-30 00:00:00',87,73000,'Belfast '),
    (93,778552911,3,'Lead Software Engineer','Engineering','Engineering ','1980-04-28 00:00:00','S','M','2008-12-27 00:00:00',78,59,1,'57FB2C0F-B105-49F0-967A-88F3D743CB3F','2014-06-30 00:00:00',93,73000,'Belfast '),
    (102,360868122,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1983-10-26 00:00:00','S','M','2008-12-03 00:00:00',66,53,1,'C75F2740-ACE3-4EBF-91C5-7AB352E1095F','2014-06-30 00:00:00',102,73000,'Belfast '),
    (108,630184120,3,'Lead Software Engineer','Engineering','Engineering ','1989-02-05 00:00:00','S','M','2008-12-08 00:00:00',77,58,1,'2BCA07D3-F2AC-4406-904F-E09156F3EB3E','2014-06-30 00:00:00',108,73000,'Belfast '),
    (127,750905084,3,'Lead Data Engineer','Data Engineering','Data & AI','1983-07-02 00:00:00','S','M','2009-01-03 00:00:00',73,56,1,'516538E8-115B-44F4-AA7B-E6C1D9F8ADFC','2014-06-30 00:00:00',127,73000,'Belfast '),
    (134,45615666,3,'Lead Software Engineer','Engineering','Engineering ','1985-01-19 00:00:00','M','M','2009-01-14 00:00:00',40,40,1,'2ABCF39B-88D7-49FA-820A-83D223322BA5','2014-06-30 00:00:00',134,73000,'Belfast '),
    (145,386315192,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1981-08-18 00:00:00','S','F','2009-01-27 00:00:00',69,54,1,'F9E1DC46-0D03-4A8A-B693-1A964BC13E6C','2014-06-30 00:00:00',145,73000,'Belfast '),
    (152,319472946,3,'Lead Software Engineer','Engineering','Engineering ','1977-04-06 00:00:00','M','M','2009-02-01 00:00:00',41,40,1,'F1A684F4-02DB-4B22-8977-6D8D3A21100E','2014-06-30 00:00:00',152,73000,'Belfast '),
    (160,712885347,3,'Lead Data Engineer','Data Engineering','Data & AI','1977-01-15 00:00:00','M','M','2009-01-21 00:00:00',74,57,1,'7C7D459E-1F49-427D-9BD5-DE31880C85DC','2014-06-30 00:00:00',160,73000,'Belfast '),
    (166,60114406,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1983-06-22 00:00:00','S','M','2009-02-21 00:00:00',68,54,1,'69A47230-70EE-48FD-AC15-C39F3712FF14','2014-06-30 00:00:00',166,73000,'Belfast '),
    (180,862951447,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1984-11-18 00:00:00','S','F','2009-02-20 00:00:00',42,41,1,'5BE8B211-CBE5-45D8-84FD-23F36A881473','2014-06-30 00:00:00',180,73000,'Belfast '),
    (186,551834634,3,'Lead Software Engineer','Engineering','Engineering ','1990-05-24 00:00:00','S','M','2009-02-08 00:00:00',75,57,1,'2625C358-672A-4000-AD67-B8CD3F318285','2014-06-30 00:00:00',186,73000,'Belfast '),
    (192,634335025,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1983-02-28 00:00:00','M','F','2009-03-05 00:00:00',71,55,1,'714D519B-375E-4C5A-8491-C758D00CF95F','2014-06-30 00:00:00',192,73000,'Belfast '),
    (205,332349500,3,'Lead Software Engineer','Engineering','Engineering ','1980-07-18 00:00:00','S','F','2009-02-26 00:00:00',76,58,1,'23D436FC-08F7-4988-8B4D-490AA4E8B7E7','2014-06-30 00:00:00',205,73000,'Belfast '),
    (12,480168528,4,'Senior Software Engineer','Engineering','Engineering ','1959-07-29 00:00:00','M','M','2007-12-11 00:00:00',9,24,1,'1D955171-E773-4FAD-8382-40FD898D5D4D','2014-06-30 00:00:00',12,73000,'Belfast '),
    (13,486228782,4,'Senior Data Engineer','Data Engineering','Data & AI','1989-05-28 00:00:00','M','F','2010-12-23 00:00:00',8,24,1,'954B91B6-5AA7-48C2-8685-6E11C6E5C49A','2014-06-30 00:00:00',13,73000,'Belfast '),
    (248,480951955,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1979-07-01 00:00:00','S','M','2009-03-08 00:00:00',59,49,1,'AC35337D-7C75-4DEE-BB11-6564F257FE18','2014-06-30 00:00:00',248,77211.516,'Belfast '),
    (245,363910111,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1976-01-04 00:00:00','M','F','2009-02-18 00:00:00',58,49,1,'3FFBA84E-8E97-4649-A5E1-859649D83AAE','2014-06-30 00:00:00',245,77211.516,'Belfast '),
    (235,535145551,2,'Solution Architect','Engineering','Engineering ','1976-02-11 00:00:00','M','F','2008-12-06 00:00:00',54,47,1,'65028F15-4149-4DE5-B203-9D7EC86BAF87','2014-06-30 00:00:00',235,79247.048,'Belfast '),
    (267,58317344,2,'Data Solution Architect','Data Engineering','Data & AI','1978-05-19 00:00:00','S','F','2009-02-16 00:00:00',74,57,1,'45C3D0F5-3332-419D-AD40-A98996BB5531','2014-06-30 00:00:00',267,80019.096,'Belfast '),
    (268,314747499,2,'Test Architect','Testing and Quality Assurance','Engineering ','1988-03-13 00:00:00','S','M','2009-02-03 00:00:00',73,56,1,'BE190269-4003-4D7F-809E-7B3FDC235DA8','2014-06-30 00:00:00',268,80019.096,'Belfast '),
    (269,671089628,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1987-05-26 00:00:00','M','M','2009-01-11 00:00:00',72,56,1,'71B0D010-5AC5-4E91-8EFA-C311C1372A73','2014-06-30 00:00:00',269,80019.096,'Belfast '),
    (272,525932996,2,'Solution Architect','Engineering','Engineering ','1985-01-30 00:00:00','M','F','2008-12-23 00:00:00',71,55,1,'241535C7-7A31-4A6A-9E0D-A83C30C2EDDA','2014-06-30 00:00:00',272,80019.096,'London'),
    (16,24756624,1,'Principle Data Solution Architect','Data Engineering','Data & AI','1975-03-19 00:00:00','S','M','2007-12-20 00:00:00',40,40,1,'E87029AA-2CBA-4C03-B948-D83AF0313E28','2014-06-30 00:00:00',16,83950,'Birmingham '),
    (211,398223854,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1977-10-26 00:00:00','S','M','2009-02-28 00:00:00',80,60,1,'05C84608-F445-4F9D-BB5C-0828C309C29D','2014-12-26 09:17:08.637000',211,84230.904,'Belfast '),
    (11,974026903,3,'Lead Software Engineer','Engineering','Engineering ','1978-01-17 00:00:00','S','M','2010-12-05 00:00:00',7,23,1,'F68C7C19-FAC1-438C-9BB7-AC33FCC341C3','2014-06-30 00:00:00',11,84230.904,'Gdansk'),
    (4,112457891,3,'Lead Data Engineer','Data Engineering','Data & AI','1974-12-23 00:00:00','S','M','2007-12-05 00:00:00',48,80,1,'59747955-87B8-443F-8ED4-F8AD3AFDF3A9','2014-06-30 00:00:00',4,87150.904,'London'),
    (250,895209680,3,'Lead Software Engineer','Engineering','Engineering ','1978-02-10 00:00:00','S','F','2011-02-25 00:00:00',49,44,1,'7D6B0155-0191-4599-8394-378EBDE63C9A','2014-06-30 00:00:00',250,87600,'Birmingham '),
    (265,749389530,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1977-03-27 00:00:00','S','M','2008-12-04 00:00:00',70,55,1,'2E680C1C-7C02-4343-9626-6F97273414C0','2014-06-30 00:00:00',265,94759.548,'Belfast '),
    (266,672243793,3,'Lead Test Engineer','Testing and Quality Assurance','Engineering ','1980-05-28 00:00:00','S','M','2009-02-23 00:00:00',69,54,1,'86601E6A-6955-40FC-BB4A-1053A843CE99','2014-06-30 00:00:00',266,94759.548,'Gdansk'),
    (15,56920285,3,'Lead Software Engineer','Engineering','Engineering ','1961-05-02 00:00:00','M','F','2011-01-18 00:00:00',4,22,1,'54F2FDC0-87C4-4065-A7A8-9AC8EA624235','2014-06-30 00:00:00',15,95461.516,'Toronto'),
    (5,695256908,3,'Lead Data Engineer','Data Engineering','Data & AI','1952-09-27 00:00:00','M','F','2008-01-06 00:00:00',5,22,1,'EC84AE09-F9B8-4A15-B4A9-6CCBAB919B08','2014-06-30 00:00:00',5,95461.516,'Birmingham '),
    (6,998320692,3,'Lead Software Engineer','Engineering','Engineering ','1959-03-11 00:00:00','M','M','2008-01-24 00:00:00',6,23,1,'E39056F1-9CD5-478D-8945-14ACA7FBDCDD','2014-06-30 00:00:00',6,95461.516,'Belfast '),
    (241,30845,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1983-07-08 00:00:00','M','M','2009-01-30 00:00:00',57,48,1,'2DC9D534-F5D1-4A14-8282-0A2A0EB6FD4D','2014-06-30 00:00:00',241,101427.952,'Gdansk'),
    (14,42487730,3,'Lead Data Engineer','Analysis & Data Architecture ','Data & AI','1979-06-16 00:00:00','S','M','2010-12-30 00:00:00',3,21,1,'46286CA4-46DD-4DDB-9128-85B67E98D1A9','2014-06-30 00:00:00',14,105288.484,'London'),
    (16,24756624,1,'Principle Architect','Engineering','Engineering ','1975-03-19 00:00:00','S','M','2007-12-20 00:00:00',40,40,1,'E87029AA-2CBA-4C03-B948-D83AF0313E28','2014-06-30 00:00:00',16,109500,'Birmingham '),
    (270,643805155,2,'Test Architect','Testing and Quality Assurance','Engineering ','1975-05-17 00:00:00','S','M','2009-01-17 00:00:00',67,53,1,'0C7F025D-8D56-48EF-86C0-F09DB63D0182','2014-06-30 00:00:00',270,112307.58,'Belfast '),
    (271,929666391,2,'Data Solution Architect','Data Engineering','Data & AI','1976-01-06 00:00:00','M','M','2009-01-22 00:00:00',66,53,1,'2474E1A9-902D-466C-B0B2-6DCAC927F753','2014-06-30 00:00:00',271,112307.58,'Gdansk'),
    (234,184188301,1,'Principle Architect','Engineering','Engineering ','1976-01-06 00:00:00','M','F','2009-01-31 00:00:00',0,20,1,'D5E315A6-BD65-4D67-9D5F-81EF5C4EF8A6','2014-06-30 00:00:00',234,114055.2,'London'),
    (264,858323870,2,'Test Architect','Testing and Quality Assurance','Engineering ','1984-03-25 00:00:00','S','F','2009-02-04 00:00:00',68,54,1,'221CBB7B-8BAE-452B-A16F-A67EBB3873C8','2014-06-30 00:00:00',264,115817.42,'Birmingham '),
    (249,121491555,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1984-10-11 00:00:00','S','F','2008-12-25 00:00:00',55,47,1,'8F410408-4AA8-4D67-886D-530BFE4EBE3B','2014-06-30 00:00:00',249,126346.064,'Belfast '),
    (3,509647174,2,'Solution Architect','Engineering','Engineering ','1974-11-12 00:00:00','M','M','2007-11-11 00:00:00',2,21,1,'9BBBFB2C-EFBB-4217-9AB7-F97689328841','2014-06-30 00:00:00',3,126346.064,'Gdansk'),
    (274,502097814,2,'Data Solution Architect','Data Engineering','Data & AI','1951-10-17 00:00:00','M','M','2011-01-04 00:00:00',14,27,1,'86D5FA9E-4BC0-48C8-91DC-1EC467418D11','2014-06-30 00:00:00',274,140454.92,'London'),
    (285,481044938,2,'Solution Architect','Engineering','Engineering ','1975-01-11 00:00:00','M','M','2013-03-14 00:00:00',20,30,1,'86F292DB-B73C-429D-9912-800994D809FB','2014-06-30 00:00:00',285,140454.92,'Birmingham '),
    (287,982310417,2,'Data Architect','Analysis & Data Architecture ','Data & AI','1957-09-20 00:00:00','M','F','2012-04-16 00:00:00',21,30,1,'66D66445-EE78-4676-9E66-0E22D6109A92','2014-06-30 00:00:00',287,140454.92,'Toronto'),
    (234,184188301,1,'Principle Data Solution Architect','Data Engineering','Data & AI','1976-01-06 00:00:00','M','F','2009-01-31 00:00:00',0,20,1,'D5E315A6-BD65-4D67-9D5F-81EF5C4EF8A6','2014-06-30 00:00:00',234,141788.484,'Gdansk'),
    (263,441044382,1,'Principle Data Architect','Analysis & Data Architecture ','Data & AI','1975-12-13 00:00:00','S','F','2008-12-11 00:00:00',65,52,1,'794A0B1F-C46A-401C-984D-008996FC7092','2014-06-30 00:00:00',263,147403.936,'London'),
    (7,134969118,3,'Lead Data Engineer','Data Engineering','Data & AI','1987-02-24 00:00:00','M','M','2009-02-08 00:00:00',61,50,1,'4F46DECA-EF01-41FD-9829-0ADAB368E431','2014-06-30 00:00:00',7,147403.936,'Birmingham '),
    (234,184188301,1,'Principle Test Architect','Testing and Quality Assurance','Engineering ','1976-01-06 00:00:00','M','F','2009-01-31 00:00:00',0,20,1,'D5E315A6-BD65-4D67-9D5F-81EF5C4EF8A6','2014-06-30 00:00:00',234,175480.904,'Belfast '),
    (2,245797967,1,'Principle Data Solution Architect','Data Engineering','Data & AI','1971-08-01 00:00:00','S','F','2008-01-31 00:00:00',1,20,1,'45E8F437-670D-4409-93CB-F9424A40D6EE','2014-06-30 00:00:00',2,185307.58,'Gdansk'),
    (273,112432117,1,'Principle Architect','Engineering','Engineering ','1977-06-06 00:00:00','S','M','2011-02-15 00:00:00',10,25,1,'F3EC557C-8B41-4EE6-BB0C-E3B93AFF81E5','2014-06-30 00:00:00',273,210576.968,'London'),
    (25,519899904,1,'Principle Data Architect','Analysis & Data Architecture ','Data & AI','1983-01-07 00:00:00','S','M','2009-02-03 00:00:00',64,52,1,'D7314F24-2AF1-429C-9BBB-4038F45F3E6C','2014-06-30 00:00:00',25,245673.032,'Birmingham ');
