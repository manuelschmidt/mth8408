//
// Created by andre on 4/1/17.
//

#include <gtest/gtest.h>
#include <Eigen/Dense>
#include <an_min_snap_traj/TrajectoryMath.hpp>

using namespace an_min_snap_traj;
using namespace Eigen;

TEST(traj_math, polyval0){
    Vector3d v;
    v << 3, 2, 1;
    double answer = polyval(v, 5.0);
    EXPECT_TRUE(answer == 86);
    answer = polyval(v, 7);
    EXPECT_TRUE(answer == 162);
    answer = polyval(v, 9);
    EXPECT_TRUE(answer == 262);
}

TEST(traj_math, polyder0){
    VectorXd v(7);
    v << 1, 1, 1, 1, 1, 1, 1;
    VectorXd vdev(7);
    vdev << 6, 5, 4, 3, 2, 1;
    auto answer = polyder(v);
    EXPECT_TRUE(answer.isApprox(vdev));

    answer = polyder(vdev);
    VectorXd vans(5);
    vans << 30, 20, 12, 6, 2;
    std::cout << answer << std::endl;
    EXPECT_TRUE(answer.isApprox(v));
}